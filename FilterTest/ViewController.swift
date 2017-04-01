//
//  ViewController.swift
//  FilterTest
//
//  Created by Cedric Wu on 05/03/2017.
//  Copyright © 2017 Cedric Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filterView: CedFilterView!
    let viewModel = ViewModel()
    var selectedChain: CedFilterChain!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view, typically from a nib.

        filterView = CedFilterView(frame: CGRect(x: 0, y: 64, width: 320, height: 35))
        filterView.delegate = self
        filterView.dataSource = self

        view.addSubview(filterView)
    }

    func getLastNodeAndSubItemsForChain(chain: CedFilterChain) -> (CedFilterNode, [ESFFilterItemModel]?) {
        var node = chain.startNode
        let model: ESFFilterItemModel = viewModel.filterModels[node.section]

        var subItems = model.subItems

        while node.next != nil {
            subItems = subItems?[node.row].subItems
            node = node.next!
        }

        return (node, subItems)
    }
}

extension ViewController: CedFilterViewDataSource, CedFilterViewDelegate {
    func numberOfSection() -> Int {
        if viewModel.filterModels.count > 0 {
            return viewModel.filterModels.count
        } else {
            return 3
        }
    }

    func titleForSection(_ section: CedFilterSection) -> String {
        if viewModel.filterModels.count > 0 {
            let index = section.section
            if index < viewModel.filterModels.count {
                return viewModel.filterModels[index].displayText ?? ""
            }
            return ""
        } else {
            switch section.section {
            case 0:
                return "责任小区"
            case 1:
                return "带看结果"
            case 2:
                return "看房时间"
            default:
                return ""
            }

        }
    }

    func numberOfColumnForSection(_ section: CedFilterSection) -> Int {
        if viewModel.maxDepth == -1 {
            return 1
        }
        return viewModel.maxDepth
    }

    func numberOfRowForChain(_ chain: CedFilterChain) -> Int {
        let (_, subItems) = getLastNodeAndSubItemsForChain(chain: chain)
        if subItems != nil {
            return subItems!.count
        } else {
            return 0
        }

    }

    func cellForRowIn(tableView: UITableView, chain: CedFilterChain) -> UITableViewCell {
        if chain.startNode.column != 0 {
            return UITableViewCell()
        }

        let allowMutli = isColumnAllowMultiForRow(chain)
//        let shouldGoNext = shouldGoNextForRow(chain)
        var selectedFlag = false
        let (node, subItems) = getLastNodeAndSubItemsForChain(chain: chain)

        var isSelectedChainPartOfCurrentSelection = false
        for c in filterView.currentSelection!.chains {
            if filterView.currentSelectedChain != nil {
                if c ~= filterView.currentSelectedChain! {
                    isSelectedChainPartOfCurrentSelection = true
                    break
                }
            }
        }

        if allowMutli {
            if let selection = filterView.currentSelection {
                for m in 0 ..< selection.chains.count {
                    let c = selection.chains[m]
                    if c ~= chain {
                        selectedFlag = true
                    }
                }
            }
        } else {
            if filterView.currentSelectedChain != nil {
                if isSelectedChainPartOfCurrentSelection {
                    if let selection = filterView.currentSelection {
                        for m in 0 ..< selection.chains.count {
                            let c = selection.chains[m]
                            if c == chain {
                                selectedFlag = true
                            }
                        }
                    }
                }
                if chain == filterView.currentSelectedChain! {
                    selectedFlag = true
                }
            } else {
                if let selection = filterView.currentSelection {
                    for m in 0 ..< selection.chains.count {
                        let c = selection.chains[m]
                        if c ~= chain {
                            selectedFlag = true
                        }
                    }
                }
            }

        }

        let filterModel = viewModel.filterModels[node.section]
        let depth = ESFFilterItemModel.getDepth(model: filterModel)

        var mainTitle = ""
        var extraTitle = ""

        if let sub = subItems {
            if node.row < sub.count {
                mainTitle = sub[node.row].displayText ?? ""
                extraTitle = sub[node.row].extInfo ?? ""
            }
        }

        if mainTitle == "不限" {
            selectedFlag = false
        }

        var identifier: String!
        if depth == 2 {
            if extraTitle.isEmpty {
                identifier = "ESFCountDownCell2"
                var cell: ESFCountDownCell2? = tableView.dequeueReusableCell(withIdentifier: identifier) as? ESFCountDownCell2
                if cell == nil {
                    cell = ESFCountDownCell2(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                }

                cell?.fillWith(mainTitle: mainTitle)
                cell?.setSelect(flag: selectedFlag)
                if cell != nil {
                    return cell!
                } else {
                    return UITableViewCell()
                }
            } else {
                identifier = "ESFCountDownCell1"
                var cell: ESFCountDownCell1? = tableView.dequeueReusableCell(withIdentifier: identifier) as? ESFCountDownCell1
                if cell == nil {
                    cell = ESFCountDownCell1(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                }

                cell?.fillWith(mainTitle: mainTitle, extraTitle: extraTitle)
                cell?.setSelect(flag: selectedFlag)
                if cell != nil {
                    return cell!
                } else {
                    return UITableViewCell()
                }
            }
        } else if depth == 3 {
            identifier = "ESFHouseFilterCell"
            if node.column == 0 {
                identifier = "ESFHouseFilterLeftCell"
            }
            var cell: ESFHouseFilterCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ESFHouseFilterCell
            if cell == nil {
                if identifier == "ESFHouseFilterCell" {
                    cell = ESFHouseFilterCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                } else {
                    cell = ESFHouseFilterLeftCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                }
            }

            if node.column == 0 {
                cell.setMinorSelect(flag: selectedFlag, str: mainTitle, col: node.column)
            } else {
                cell.setMajorSelect(flag: selectedFlag, str: mainTitle, col: node.column)
            }
            return cell
        }

        return UITableViewCell()
    }

    func numberOfTableToShow(_ section: CedFilterSection) -> Int {
        guard section.section < viewModel.filterModels.count else {
            return 1
        }
        let filterModel = viewModel.filterModels[section.section]
        let num = filterModel.getDepth()
        return num
    }

    func shouldExpandViewForSection(_ section: CedFilterSection) -> Bool {
        guard section.section < viewModel.filterModels.count else {
            return false
        }

        var flag = true

        if filterView.currentSelection == nil {
            flag = true
        } else {
            return section.section != filterView.currentSelection!.section
        }

        for index in 0 ..< filterView.sectionViewsArray.count {
            if index == section.section {
                filterView.sectionViewsArray[index].setSectionViewSelect(flag: flag)
            } else {
                filterView.sectionViewsArray[index].setSectionViewSelect(flag: false)
            }
        }
        return flag

    }

    func shouldGoNextForRow(_ chain: CedFilterChain) -> Bool {
        let node = chain.startNode.getLastNode()
        let filterModel: ESFFilterItemModel = viewModel.filterModels[node.section]
        if node.column == 0 {
            if let subitems: [ESFFilterItemModel] = filterModel.subItems {
                let item = subitems[node.row]
                return item.subItems != nil
            }
        } else if node.column == 1 {
            if let subItemsLevelOne: [ESFFilterItemModel] = filterModel.subItems {
                if let subItemsLevelTwo = subItemsLevelOne[node.prev!.row].subItems {
                    let item = subItemsLevelTwo[node.row]
                    return item.subItems != nil
                }

            }
        }

        return false
    }

    func isColumnAllowMultiForRow(_ chain: CedFilterChain) -> Bool {
        let (node, subItems) = getLastNodeAndSubItemsForChain(chain: chain)

        if subItems != nil {
//            if node.row < subItems!.count {
                let item = subItems![node.row]
                if let flag = item.multiple {
                    return flag
                }
//            }

        }
        return false
    }

    func hasAllowMultiColumnInSection(_ section: CedFilterSection) -> Bool {
        // 是否显示多选确认按钮
        let model = viewModel.filterModels[section.section]
        var showsConfirmButton = false
        if let subitems = model.subItems {
            for item in subitems {
                if item.multiple != nil && item.multiple! == true {
                    showsConfirmButton = true
                    break
                }
            }
        }
        return showsConfirmButton
    }

    func selectedAtRow(chain: CedFilterChain) {
        if var selection = filterView.currentSelection {
            let isColumnAllowMulti = isColumnAllowMultiForRow(chain)
            var chainsIndexToRemove = [Int]()
            for i in 0 ..< selection.chains.count {
                let c = selection.chains[i]
                if isColumnAllowMultiForRow(c) != isColumnAllowMulti {
                    chainsIndexToRemove.append(i)
                }
            }
            selection.chains.removeElementAtIndexes(indexes: chainsIndexToRemove)
            filterView.currentSelection = selection
        }

        selectedChain = chain.copy()
    }

    func finishSectionSelection(_ selection: CedFilterSectionSelection?, totalSelections: [Int: CedFilterSectionSelection]) {
        guard selection != nil else {
            return
        }
        for chain in selection!.chains {
            print(chain)
        }
        selectedChain = nil
        var filterArray = [String]()
        var titleArray = [String]()
        for s in totalSelections.values {
            for chain in s.chains {
                let (node, subItems) = getLastNodeAndSubItemsForChain(chain: chain)

                if node.section < viewModel.filterModels.count {
                    let str = subItems?[node.row].fullFilterKey ?? ""
                    filterArray.append(str)

                    if selection!.section == chain.startNode.section {
                        var t = subItems?[node.row].displayText ?? ""
                        while chain.length() > 1 && t == "不限" {
                            _ = chain.popLastNode()
                            let (n, subs) = getLastNodeAndSubItemsForChain(chain: chain)
                            t = subs?[n.row].displayText ?? ""
                        }
                        titleArray.append(t)
                    }
                }
            }
        }

        // 箭头关闭
        filterView.sectionViewsArray[selection!.section].setSectionViewSelect(flag: false)
        print(filterArray)
        print(titleArray)

        // 开始设置SectionView的Title

        if (filterArray.count == 0) || (titleArray.count == 1 && titleArray[0] == "不限") {
            let s = CedFilterSection(section: selection!.section)
            let t = titleForSection(s)
            filterView.sectionViewsArray[selection!.section].titleLabel.text = t
            filterView.sectionViewsArray[selection!.section].titleLabel.textColor = UIColor.black
        } else {
            let t = titleArray.joined(separator: "、")
            filterView.sectionViewsArray[selection!.section].titleLabel.text = t
            filterView.sectionViewsArray[selection!.section].titleLabel.textColor = UIColor(hex6: 0xf24500)
        }
        //        viewModel.filters = filterArray.joined(separator: ",")
        //        tableView.es_startPullToRefresh()
    }
}
