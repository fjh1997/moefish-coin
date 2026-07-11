# Catfish Coin v0.1.7 / 猫鱼币 v0.1.7

## 中文

本版本修复新节点同步历史区块时可能卡住的问题。

更新内容：

- 修复远端节点从旧高度追同步时，可能把历史 miniblock 误判为 `miner address not registered` 的问题。
- 根因：同步历史块时，节点用了本地当前 tip 的地址状态窗口去校验历史 miniblock 矿工地址；当本地还停在较低高度时，会误判后续块中的矿工地址未注册。
- 修复方式：验证候选区块时，按候选区块自己的 topo/成熟窗口读取状态，而不是按当前本地 tip 读取状态。
- 保留 v0.1.6 的 miniblock 地址哈希前 16 字节兼容修复。
- 仍然不依赖自动重启或清链；节点应能在现有链数据上继续正常同步。

使用方式：

1. 下载 `catfish-dero-public-windows.zip`
2. 解压
3. 双击 `CatfishDero.exe`
4. 节点和钱包会自动启动；需要出块时手动点击 `开始挖矿`

注意：

- 本项目仅供学习、娱乐、技术研究和评估。
- 不得用于发行融资、交易撮合、投资理财、洗钱、诈骗、传销、赌博、非法集资、非法挖矿或规避监管。
- 本项目基于 DERO HE，上游 Research License 不授予商业使用或商业分发权利。

## English

This release fixes a sync stall that could affect new or lagging nodes while importing historical blocks.

Changes:

- Fixed historical miniblocks being incorrectly rejected as `miner address not registered` during catch-up sync.
- Root cause: historical block validation used the local node's current tip-based address maturity window instead of the candidate block's own topo/maturity window.
- Fix: candidate block validation now resolves miner address registration state from the candidate block's own historical window.
- Keeps the v0.1.6 compatibility fix for the first 16 bytes of serialized miniblock miner address hashes.
- No automatic chain reset or restart workaround is required; nodes should continue syncing with existing chain data.

Usage:

1. Download `catfish-dero-public-windows.zip`
2. Extract it
3. Double-click `CatfishDero.exe`
4. The node and wallet start automatically. Click `Start Mining` manually when blocks are needed.

Notice:

- This project is for learning, entertainment, technical research, and evaluation only.
- Do not use it for issuance financing, exchange matching, investment solicitation, money laundering, fraud, pyramid schemes, gambling, illegal fundraising, illegal mining, or regulatory evasion.
- This project is based on DERO HE. The upstream Research License does not grant commercial use or commercial distribution rights.
