//
//  ViewModel.swift
//  FilterTest
//
//  Created by Cedric Wu on 05/03/2017.
//  Copyright © 2017 Cedric Wu. All rights reserved.
//

import Foundation
import ObjectMapper

class ViewModel {
    let rawString = "[{\"depth\":0,\"displayText\":\"区域\",\"filterKey\":\"district\",\"fullFilterKey\":\"district\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":true,\"style\":1,\"subItems\":[{\"depth\":1,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"龙岗\",\"filterKey\":\"1338\",\"fullFilterKey\":\"district.1338\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1338.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"布吉\",\"filterKey\":\"1377\",\"fullFilterKey\":\"district.1338.1377\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"龙岗中心城\",\"filterKey\":\"1663\",\"fullFilterKey\":\"district.1338.1663\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"坂田\",\"filterKey\":\"1376\",\"fullFilterKey\":\"district.1338.1376\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"横岗\",\"filterKey\":\"1378\",\"fullFilterKey\":\"district.1338.1378\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"平湖\",\"filterKey\":\"1381\",\"fullFilterKey\":\"district.1338.1381\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"坪地\",\"filterKey\":\"1382\",\"fullFilterKey\":\"district.1338.1382\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"南山\",\"filterKey\":\"1342\",\"fullFilterKey\":\"district.1342\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1342.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"前海\",\"filterKey\":\"1400\",\"fullFilterKey\":\"district.1342.1400\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"蛇口\",\"filterKey\":\"1401\",\"fullFilterKey\":\"district.1342.1401\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"南头\",\"filterKey\":\"1397\",\"fullFilterKey\":\"district.1342.1397\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"科技园\",\"filterKey\":\"1396\",\"fullFilterKey\":\"district.1342.1396\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"南山中心区\",\"filterKey\":\"1399\",\"fullFilterKey\":\"district.1342.1399\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"华侨城\",\"filterKey\":\"1394\",\"fullFilterKey\":\"district.1342.1394\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"南油\",\"filterKey\":\"1398\",\"fullFilterKey\":\"district.1342.1398\",\"id\":7,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"后海\",\"filterKey\":\"1395\",\"fullFilterKey\":\"district.1342.1395\",\"id\":8,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"西丽\",\"filterKey\":\"1403\",\"fullFilterKey\":\"district.1342.1403\",\"id\":9,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"宝安\",\"filterKey\":\"1341\",\"fullFilterKey\":\"district.1341\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1341.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"西乡\",\"filterKey\":\"1392\",\"fullFilterKey\":\"district.1341.1392\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"宝安中心区\",\"filterKey\":\"1387\",\"fullFilterKey\":\"district.1341.1387\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"新安\",\"filterKey\":\"1664\",\"fullFilterKey\":\"district.1341.1664\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"福永\",\"filterKey\":\"1388\",\"fullFilterKey\":\"district.1341.1388\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"松岗\",\"filterKey\":\"1390\",\"fullFilterKey\":\"district.1341.1390\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"沙井\",\"filterKey\":\"1391\",\"fullFilterKey\":\"district.1341.1391\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"石岩\",\"filterKey\":\"1389\",\"fullFilterKey\":\"district.1341.1389\",\"id\":7,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"龙华新区\",\"filterKey\":\"1340\",\"fullFilterKey\":\"district.1340\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1340.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"龙华\",\"filterKey\":\"1385\",\"fullFilterKey\":\"district.1340.1385\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"大浪\",\"filterKey\":\"1383\",\"fullFilterKey\":\"district.1340.1383\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"民治\",\"filterKey\":\"1386\",\"fullFilterKey\":\"district.1340.1386\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"观澜\",\"filterKey\":\"1384\",\"fullFilterKey\":\"district.1340.1384\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"罗湖\",\"filterKey\":\"1344\",\"fullFilterKey\":\"district.1344\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1344.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"布心\",\"filterKey\":\"6873\",\"fullFilterKey\":\"district.1344.6873\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"莲塘\",\"filterKey\":\"1672\",\"fullFilterKey\":\"district.1344.1672\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"黄贝岭\",\"filterKey\":\"1686\",\"fullFilterKey\":\"district.1344.1686\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"水库\",\"filterKey\":\"1670\",\"fullFilterKey\":\"district.1344.1670\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"翠竹\",\"filterKey\":\"1673\",\"fullFilterKey\":\"district.1344.1673\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"蔡屋围\",\"filterKey\":\"1689\",\"fullFilterKey\":\"district.1344.1689\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"东门\",\"filterKey\":\"1685\",\"fullFilterKey\":\"district.1344.1685\",\"id\":7,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"人民南\",\"filterKey\":\"6874\",\"fullFilterKey\":\"district.1344.6874\",\"id\":8,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"笋岗\",\"filterKey\":\"2057\",\"fullFilterKey\":\"district.1344.2057\",\"id\":9,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"洪湖\",\"filterKey\":\"2056\",\"fullFilterKey\":\"district.1344.2056\",\"id\":10,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"泥岗\",\"filterKey\":\"6875\",\"fullFilterKey\":\"district.1344.6875\",\"id\":11,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"宝安南\",\"filterKey\":\"6876\",\"fullFilterKey\":\"district.1344.6876\",\"id\":12,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"银湖\",\"filterKey\":\"6877\",\"fullFilterKey\":\"district.1344.6877\",\"id\":13,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"福田\",\"filterKey\":\"1343\",\"fullFilterKey\":\"district.1343\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1343.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"皇岗\",\"filterKey\":\"1687\",\"fullFilterKey\":\"district.1343.1687\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"景田\",\"filterKey\":\"6868\",\"fullFilterKey\":\"district.1343.6868\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"梅林\",\"filterKey\":\"1675\",\"fullFilterKey\":\"district.1343.1675\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"华强\",\"filterKey\":\"1680\",\"fullFilterKey\":\"district.1343.1680\",\"id\":4,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"香蜜湖\",\"filterKey\":\"1684\",\"fullFilterKey\":\"district.1343.1684\",\"id\":5,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"福田中心区\",\"filterKey\":\"1678\",\"fullFilterKey\":\"district.1343.1678\",\"id\":6,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"上步\",\"filterKey\":\"2058\",\"fullFilterKey\":\"district.1343.2058\",\"id\":7,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"新洲\",\"filterKey\":\"1676\",\"fullFilterKey\":\"district.1343.1676\",\"id\":8,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"石厦\",\"filterKey\":\"6869\",\"fullFilterKey\":\"district.1343.6869\",\"id\":9,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"莲花\",\"filterKey\":\"2055\",\"fullFilterKey\":\"district.1343.2055\",\"id\":10,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"农科中心\",\"filterKey\":\"6870\",\"fullFilterKey\":\"district.1343.6870\",\"id\":11,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"上下沙\",\"filterKey\":\"1405\",\"fullFilterKey\":\"district.1343.1405\",\"id\":12,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"八卦岭\",\"filterKey\":\"1404\",\"fullFilterKey\":\"district.1343.1404\",\"id\":13,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"竹子林\",\"filterKey\":\"6871\",\"fullFilterKey\":\"district.1343.6871\",\"id\":14,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"保税区\",\"filterKey\":\"1677\",\"fullFilterKey\":\"district.1343.1677\",\"id\":15,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"车公庙\",\"filterKey\":\"2052\",\"fullFilterKey\":\"district.1343.2052\",\"id\":16,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"笔架山\",\"filterKey\":\"6872\",\"fullFilterKey\":\"district.1343.6872\",\"id\":17,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"盐田\",\"filterKey\":\"1347\",\"fullFilterKey\":\"district.1347\",\"id\":7,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1347.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"沙头角\",\"filterKey\":\"1671\",\"fullFilterKey\":\"district.1347.1671\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"盐田港\",\"filterKey\":\"1674\",\"fullFilterKey\":\"district.1347.1674\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"梅沙\",\"filterKey\":\"1682\",\"fullFilterKey\":\"district.1347.1682\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"坪山新区\",\"filterKey\":\"1345\",\"fullFilterKey\":\"district.1345\",\"id\":8,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1345.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"坪山\",\"filterKey\":\"1669\",\"fullFilterKey\":\"district.1345.1669\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"坑梓\",\"filterKey\":\"1668\",\"fullFilterKey\":\"district.1345.1668\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"光明新区\",\"filterKey\":\"1346\",\"fullFilterKey\":\"district.1346\",\"id\":9,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1346.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"公明\",\"filterKey\":\"2054\",\"fullFilterKey\":\"district.1346.2054\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"光明\",\"filterKey\":\"1665\",\"fullFilterKey\":\"district.1346.1665\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":1,\"displayText\":\"大鹏新区\",\"filterKey\":\"1348\",\"fullFilterKey\":\"district.1348\",\"id\":10,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1,\"subItems\":[{\"depth\":2,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"district.1348.0\",\"id\":0,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"大鹏\",\"filterKey\":\"1667\",\"fullFilterKey\":\"district.1348.1667\",\"id\":1,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"南澳\",\"filterKey\":\"1681\",\"fullFilterKey\":\"district.1348.1681\",\"id\":2,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":2,\"displayText\":\"葵涌\",\"filterKey\":\"1688\",\"fullFilterKey\":\"district.1348.1688\",\"id\":3,\"maxDepth\":2,\"multiple\":false,\"selected\":false,\"style\":1}]}]},{\"depth\":0,\"displayText\":\"实勘\",\"filterKey\":\"shi_kan\",\"fullFilterKey\":\"shi_kan\",\"id\":1,\"multiple\":false,\"selected\":true,\"style\":1,\"subItems\":[{\"depth\":1,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"shi_kan.0\",\"id\":0,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"已实勘\",\"filterKey\":\"1\",\"fullFilterKey\":\"shi_kan.1\",\"id\":1,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"未实勘\",\"filterKey\":\"2\",\"fullFilterKey\":\"shi_kan.2\",\"id\":2,\"multiple\":false,\"selected\":false,\"style\":1}]},{\"depth\":0,\"displayText\":\"户型\",\"filterKey\":\"huxing\",\"fullFilterKey\":\"huxing\",\"id\":2,\"multiple\":false,\"selected\":true,\"style\":1,\"subItems\":[{\"depth\":1,\"displayText\":\"不限\",\"filterKey\":\"0\",\"fullFilterKey\":\"huxing.0\",\"id\":0,\"multiple\":false,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"一室\",\"filterKey\":\"1\",\"fullFilterKey\":\"huxing.1\",\"id\":1,\"multiple\":true,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"二室\",\"filterKey\":\"2\",\"fullFilterKey\":\"huxing.2\",\"id\":2,\"multiple\":true,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"三室\",\"filterKey\":\"3\",\"fullFilterKey\":\"huxing.3\",\"id\":3,\"multiple\":true,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"四室\",\"filterKey\":\"4\",\"fullFilterKey\":\"huxing.4\",\"id\":4,\"multiple\":true,\"selected\":false,\"style\":1},{\"depth\":1,\"displayText\":\"五室及以上\",\"filterKey\":\"5\",\"fullFilterKey\":\"huxing.5\",\"id\":5,\"multiple\":true,\"selected\":false,\"style\":1}]}]"

    var filterModels = [ESFFilterItemModel]()
    var maxDepth = -1

    init() {
        let models = Mapper<ESFFilterItemModel>().mapArray(JSONString: rawString)
        if models != nil {
            self.filterModels.append(contentsOf: models!)
            for m in self.filterModels {
                self.getFilterDepth(model: m, depth: 0)
            }
        }
    }

    func getFilterDepth(model: ESFFilterItemModel, depth: Int) {
        if model.subItems == nil {
            maxDepth = max(depth, maxDepth)
            return
        }
        if model.subItems!.count == 0 {
            maxDepth = max(depth, maxDepth)
            return
        }
        for item in model.subItems! {
            getFilterDepth(model: item, depth: depth + 1)
        }
    }

}