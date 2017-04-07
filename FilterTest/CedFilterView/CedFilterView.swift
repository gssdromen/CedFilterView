//
//  CedFilterView.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 3/19/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

protocol CedFilterViewDataSource: class {
    /// 筛选框有几栏
    ///
    /// - Returns: 栏数
    func numberOfSection() -> Int

    /// 筛选框有每栏的标题
    ///
    /// - Parameter section: 栏结构体
    /// - Returns: 栏的标题
    func titleForSection(_ section: CedFilterSection) -> String

    /// 筛选框有每栏的有几层
    ///
    /// - Parameter section: 栏结构体
    /// - Returns: 有几层
    func numberOfColumnForSection(_ section: CedFilterSection) -> Int

    /// 当前筛选层有几行
    ///
    /// - Parameter chain: 当前筛选的随意一个row
    /// - Returns: 行数
    func numberOfRowForChain(_ chain: CedFilterChain) -> Int

    /// 筛选栏Cell
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - chain: row的路径
    ///   - selection: 当前section下的所有选择
    /// - Returns:
    func cellForRowIn(tableView: UITableView, chain: CedFilterChain) -> UITableViewCell
}

protocol CedFilterViewDelegate: class {
    /// Section点击后是否打开
    ///
    /// - Parameter section: 栏结构体
    /// - Returns: 是否打开，true打开，false关闭
    func shouldExpandViewForSection(_ section: CedFilterSection) -> Bool

    /// Section点击后打开几个TableView
    ///
    /// - Parameter section: 栏结构体
    /// - Returns: 打开的数目
    func numberOfTableToShow(_ section: CedFilterSection) -> Int

    /// 筛选是否有下一层
    ///
    /// - Parameter chain: 点击的路径
    /// - Returns: 是否有下一层
    func shouldGoNextForRow(_ chain: CedFilterChain) -> Bool

    /// 筛选当前层是否多选
    ///
    /// - Parameter chain: row的路径
    /// - Returns: 是否多选
    func isColumnAllowMultiForRow(_ chain: CedFilterChain) -> Bool

    /// 当前Section中是否有支持多选的Column，如有的话会显示确认按钮
    ///
    /// - Parameter section: 栏结构体
    /// - Returns: 是否
    func hasAllowMultiColumnInSection(_ section: CedFilterSection) -> Bool

    /// 有一行被点击
    ///
    /// - Parameter chain: 点击路径
    func selectedAtRow(chain: CedFilterChain)

    /// 完成一次完整路径的点击
    ///
    /// - Parameters:
    ///   - selection: 当前Section所有选择
    ///   - totalSelections: 所有Section的所有选择
    func finishSectionSelection(_ selection: CedFilterSectionSelection?, totalSelections: [Int: CedFilterSectionSelection])
}

class CedFilterView: UIView {
    weak var dataSource: CedFilterViewDataSource? {
        didSet {
            reloadData()
        }
    }
    weak var delegate: CedFilterViewDelegate?

//    override var frame: CGRect {
//        didSet {
//            updateWithFrame(frame: frame)
//            reloadData()
//        }
//    }

    static let k1px = 1 / UIScreen.main.scale
    static let kTableHeight: CGFloat = 290
    static let kTableWidthOffset: CGFloat = 80
    static let kConfirmViewHeight: CGFloat = 47
    static let kScreenHeight: CGFloat = UIScreen.main.bounds.height
    static let kScreenWidth: CGFloat = UIScreen.main.bounds.width
    static let kSectionOffset = 1000
    var totalHeight: CGFloat = 0

    var tableViewsArray = [CedFilterTableView]()
    var sectionViewsArray = [SectionView]()

    /// 当前点开Section所有的选中
    var currentSelection: CedFilterSectionSelection?
    /// 所有Section所有的选中
    var totalSelections = [Int: CedFilterSectionSelection]()
    /// 本次操作中点中的路径
    var currentSelectedChain: CedFilterChain?

    var sectionViewHeight: CGFloat = 0

    var confirmButton: UIButton!
    var confirmView: UIView!

    var bgView = UIView()

    // MARK: - Event
    func confirmAction() {
        totalSelections[currentSelection!.section] = currentSelection!

        delegate!.finishSectionSelection(currentSelection, totalSelections: totalSelections)

        resetFotNextSelection()
        close()
    }

    func bgViewAction() {
        close()
    }

    // MARK: - Private Method
    fileprivate func handleSelectedForCurrentSelectedChain(node: CedFilterNode) {
        node.prev = nil
        node.next = nil
        if let selectedChain = currentSelectedChain {
            weak var pNode: CedFilterNode! = selectedChain.startNode
            while pNode != nil {
                if pNode.column == node.column {
                    // 不是Chain的第一个点
                    if pNode.prev != nil {
                        pNode.prev!.next = node
                    } else {
                        let n = CedFilterNode(section: pNode.section, column: pNode.column, row: node.row, title: "", selected: false)
                        currentSelectedChain = CedFilterChain(node: n)
                    }
                    return
                }
                pNode = pNode.next
            }
            if node.column == selectedChain.startNode.getLastNode().column + 1 {
                selectedChain.startNode.getLastNode().connect(node)
            }
        } else {
            currentSelectedChain = CedFilterChain(node: node)
        }
    }

    fileprivate func resetFotNextSelection() {
        for table in tableViewsArray {
            table.selectedNodes.removeAll()
        }
        currentSelection = nil
        currentSelectedChain = nil
    }

    fileprivate func setSelectedNodeForTableView(tableIndex: Int, curNode: CedFilterNode) {
        guard tableIndex >= 0 else {
            return
        }
        if let chain = getChainForNeedCell(curNode: curNode) {
            let allowMulti = delegate!.isColumnAllowMultiForRow(chain)
            // 判断是否允许多选，如果不允许，需要把以前的selectedNodes清空
            if !allowMulti {
                tableViewsArray[tableIndex].selectedNodes.removeAll()
            }
            tableViewsArray[tableIndex].selectedNodes.append(curNode)
        }
    }

    // 此处假设所有的多选都是最后一层，不支持多选不是最后一层的情况
    fileprivate func getChainForNeedCell(curNode: CedFilterNode?) -> CedFilterChain? {
        var chain: CedFilterChain! = nil
        if let curN = curNode {
            weak var pLastNode: CedFilterNode? = curNode

            for i in (0 ..< curN.column).reversed() {
                if i < tableViewsArray.count {
                    if tableViewsArray[i].selectedNodes.count > 0 {
                        if let node = tableViewsArray[i].selectedNodes[0].copy() as? CedFilterNode {
                            pLastNode!.prev = node
                            node.next = pLastNode
                            pLastNode = node
                        }
                    }
                }
            }
            chain = CedFilterChain(node: curN.getFirstNode())
        } else {
            for i in 0 ..< tableViewsArray.count {
                let table = tableViewsArray[i]
                if table.selectedNodes.count > 0 {
                    if let node = tableViewsArray[i].selectedNodes[0].copy() as? CedFilterNode {
                        if i == 0 {
                            chain = CedFilterChain(node: node)
                        } else {
                            chain.startNode.getLastNode().connect(node)
                        }
                    }
                }
            }
        }

        if chain != nil {
            return chain!.startNode.column == 0 ? chain! : nil
        }
        return chain
    }

    func sectionClicked(_ gesture: UITapGestureRecognizer) {
        let section = CedFilterSection(section: gesture.view!.tag)

        let flag = delegate!.shouldExpandViewForSection(section)

        if flag {
            // 打开筛选
            // 配置现在section选择的Selection
            if totalSelections.keys.contains(section.section) {
                currentSelection = totalSelections[section.section]
            } else {
                currentSelection = CedFilterSectionSelection(section: section.section, chains: [])
            }

            let numberOfTableToShow = delegate!.numberOfTableToShow(section)
            let allowMultiColumnInSection = delegate!.hasAllowMultiColumnInSection(section)

            frame.size.height = totalHeight
            if allowMultiColumnInSection {
                confirmView.isHidden = false
                for table in tableViewsArray {
                    table.contentInset.bottom = CedFilterView.kConfirmViewHeight
                }
            } else {
                confirmView.isHidden = true
                for table in tableViewsArray {
                    table.contentInset.bottom = 0
                }
            }

            for i in 0 ..< tableViewsArray.count {
                let tableView = tableViewsArray[i]
                if i < numberOfTableToShow {
                    // 把原来的SelectedNode赋值回去
                    if let chain = currentSelection!.chains.first {
                        if let node = chain.getNodeAt(index: i) {
                            tableView.selectedNodes = [node]
                        }
                    }

                    tableView.isHidden = false
                    tableView.reloadData()
                } else {
                    tableView.isHidden = true
                }
            }
        } else {
            // 关闭筛选
            frame.size.height = sectionViewHeight
            currentSelection = nil
            close()
        }
    }

    // MARK: - Public Methods
    func reloadData() {
        if dataSource != nil {
            let sectionCount = dataSource!.numberOfSection()
            var tableViewCount = 0

            for i in 0 ..< sectionCount {
                let section = CedFilterSection(section: i)
                if dataSource!.numberOfColumnForSection(section) > tableViewCount {
                    // 得到最大的需求数
                    tableViewCount = dataSource!.numberOfColumnForSection(section)
                }
            }
            layoutSectionViews(sectionCount)
            layoutTableViews(tableViewCount, needsConfirmButton: true)
        }
    }

    func isExpand() -> Bool {
        for view in tableViewsArray {
            if !view.isHidden {
                return true
            }
        }
        return false
    }

    func close() {
        resetFotNextSelection()
        for view in tableViewsArray {
            view.isHidden = true
        }
        for view in sectionViewsArray {
            view.setSectionViewSelect(flag: false)
        }
        frame.size.height = sectionViewHeight
    }

    // MARK: - Views About
    func layoutSectionViews(_ sectionCount: Int) {
        guard sectionCount > 0 else {
            return
        }
        _ = sectionViewsArray.map { (view) -> Void in
            view.removeFromSuperview()
        }
        sectionViewsArray.removeAll()

        let sectionWidth = UIScreen.main.bounds.width / CGFloat(sectionCount)
        for i in 0 ..< sectionCount {
            let sectionView = SectionView(frame: CGRect(x: CGFloat(i) * sectionWidth, y: 0, width: sectionWidth, height: sectionViewHeight))
            sectionView.titleLabel.textAlignment = .center
            sectionView.isUserInteractionEnabled = true
            let section = CedFilterSection(section: i)
            sectionView.titleLabel.text = dataSource!.titleForSection(section)
            sectionView.tag = i
            let tap = UITapGestureRecognizer(target: self, action: #selector(CedFilterView.sectionClicked(_:)))
            sectionView.addGestureRecognizer(tap)
            addSubview(sectionView)
            sectionViewsArray.append(sectionView)
        }
        // 生成上下分割线
        let topSepLine = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: CedFilterView.k1px))
        topSepLine.backgroundColor = UIColor(hex6: 0xd8d8d8)
        addSubview(topSepLine)
        let bottomSepLine = UIView(frame: CGRect(x: 0, y: sectionViewHeight - CedFilterView.k1px, width: bounds.width, height: CedFilterView.k1px))
        bottomSepLine.backgroundColor = UIColor(hex6: 0xd8d8d8)
        addSubview(bottomSepLine)
    }

    func layoutTableViews(_ tableViewCount: Int, needsConfirmButton: Bool) {
        guard tableViewCount > 0 else {
            return
        }
        _ = tableViewsArray.map { (tableView) -> Void in
            tableView.removeFromSuperview()
        }
        tableViewsArray.removeAll()

        for i in 0 ..< tableViewCount {
            let tableView = CedFilterTableView(frame: CGRect(x: CGFloat(i) * CedFilterView.kTableWidthOffset, y: bounds.height, width: bounds.width - CGFloat(i) * CedFilterView.kTableWidthOffset, height: CedFilterView.kTableHeight))
            tableView.rowHeight = 44
            tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.tag = i + CedFilterView.kSectionOffset

            tableView.isHidden = true
            addSubview(tableView)
            tableViewsArray.append(tableView)
        }
        // 多选需要确定按钮
        if needsConfirmButton {
            confirmButton = UIButton(type: .custom)
            let width = bounds.size.width - 21 * 2
            confirmButton.frame = CGRect(x: 21, y: 8, width: width, height: 32)
            confirmButton.layer.cornerRadius = 3
            confirmButton.backgroundColor = UIColor(hex6: 0xF24500)
            confirmButton.setTitle("确认", for: UIControlState.normal)
            confirmButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            confirmView = UIView(frame: CGRect(x: 0, y: CedFilterView.kTableHeight + bounds.height - CedFilterView.kConfirmViewHeight, width: CedFilterView.kScreenWidth, height: CedFilterView.kConfirmViewHeight))
            confirmView.addSubview(confirmButton)
            confirmView.backgroundColor = UIColor.white
            confirmButton.addTarget(self, action: #selector(CedFilterView.confirmAction), for: UIControlEvents.touchUpInside)
            let sepLine = UIView(frame: CGRect(x: 0, y: 0, width: CedFilterView.kScreenWidth, height: CedFilterView.k1px))
            sepLine.backgroundColor = UIColor(hex6: 0xd0d0d0)

            confirmView.addSubview(sepLine)
            addSubview(confirmView)
        }
    }

    func updateWithFrame(frame: CGRect) {
        sectionViewHeight = frame.size.height
        totalHeight = CedFilterView.kScreenHeight - frame.origin.y
        bgView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: totalHeight)
    }

    // MARK: - Life Cycle
    convenience init() {
        self.init(frame: CGRect.zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear

        bgView.backgroundColor = UIColor(hex6: 0x000000, alpha: 0.4)
        addSubview(bgView)
        bgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CedFilterView.bgViewAction)))
        updateWithFrame(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension CedFilterView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currentSelection != nil else {
            return UITableViewCell()
        }
        // 一个section中的第几个tableView
        let tableViewNumber = tableView.tag - CedFilterView.kSectionOffset
        let node = CedFilterNode(section: currentSelection!.section, column: tableViewNumber, row: indexPath.row, title: "", selected: true)

        let chain = getChainForNeedCell(curNode: node)
        print("ask cell for " + chain!.description)

        let cell = dataSource!.cellForRowIn(tableView: tableView, chain: chain!)

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard currentSelection != nil else {
            return 0
        }
        // 一个section中的第几个tableView
        let tableViewNumber = tableView.tag - CedFilterView.kSectionOffset
        let node = CedFilterNode(section: currentSelection!.section, column: tableViewNumber, row: 0, title: "", selected: false)

        if let chain = getChainForNeedCell(curNode: node) {
            let num = dataSource!.numberOfRowForChain(chain)
            return num
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard currentSelection != nil else {
            return
        }
        // 一个section中的第几个tableView
        let tableViewNumber = tableView.tag - CedFilterView.kSectionOffset
        let node = CedFilterNode(section: currentSelection!.section, column: tableViewNumber, row: indexPath.row, title: "", selected: false)
        setSelectedNodeForTableView(tableIndex: tableViewNumber, curNode: node)
//        handleSelectedForCurrentSelectedChain(node: node)
        let curChain = getChainForNeedCell(curNode: node)

        if curChain != nil && currentSelection != nil {
            currentSelectedChain = curChain!
            delegate!.selectedAtRow(chain: curChain!)

            let allowMulti = curChain == nil ? false : delegate!.isColumnAllowMultiForRow(curChain!)

            if allowMulti {
                var needsToCleanIndexes = [Int]()
                for i in 0 ..< currentSelection!.chains.count {
                    let chain = currentSelection!.chains[i]
                    if chain == currentSelectedChain! {
                        needsToCleanIndexes.append(i)
                    }
                }
                if needsToCleanIndexes.count == 1 {
                    _ = currentSelection!.chains.remove(at: needsToCleanIndexes[0])
                } else {
                    currentSelection!.chains.append(currentSelectedChain!)
                }
                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
            } else {
                let shouldGoNext = delegate!.shouldGoNextForRow(curChain!)

                if shouldGoNext {
                    tableView.reloadData()
                    if tableViewNumber + 1 < tableViewsArray.count {
                        let t = tableViewsArray[tableViewNumber + 1]
                        t.isHidden = false
                        t.reloadData()
                    }
                } else {
                    currentSelection!.chains.removeAll()
                    currentSelection!.chains.append(currentSelectedChain!)
                    totalSelections[currentSelection!.section] = currentSelection!

                    print(curChain!)
                    delegate!.finishSectionSelection(currentSelection, totalSelections: totalSelections)
                    resetFotNextSelection()
                    close()
                }
            }
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
