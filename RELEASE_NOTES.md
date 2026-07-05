# Catfish Coin v0.1.3 / 猫鱼币 v0.1.3

## 中文

本版本改进区块浏览器和挖矿启动检查。

更新内容：

- 区块链浏览器的公开区块列表新增出块时间。
- 出块时间会按本机语言格式显示。
- 修复已注册钱包在 getwork 挖矿接口被误判为 `unregistered miner` 的问题。
- 矿工地址验证现在会从 miniblock `KeyHash` 精确解析已注册地址，避免近似 hash 查询误杀。
- 点击开始挖矿前会检查当前钱包地址是否已满足 DERO 挖矿地址成熟期。
- 如果地址刚注册但还不能挖矿，会提示还需要大约几个区块，而不是启动 miner 后在日志里刷 `unregistered miner or you need to wait 15 mins`。

使用方式：

1. 下载 `catfish-dero-public-windows.zip`
2. 解压
3. 双击 `CatfishDero.exe`
4. 需要出块时手动点击 `开始挖矿`

注意：

- 本项目仅供学习、娱乐、技术研究和评估。
- 不得用于发行融资、交易撮合、投资理财、洗钱、诈骗、传销、赌博、非法集资、非法挖矿或规避监管。
- 本项目基于 DERO HE，上游 Research License 不授予商业使用或商业分发权利。

## English

This release improves the block explorer and mining startup checks.

Changes:

- Added block time to the public block list in the explorer.
- Block time is formatted using the local UI language.
- Fixed a case where registered wallets could be rejected by the getwork mining interface as `unregistered miner`.
- Miner address validation now resolves registered addresses exactly from miniblock `KeyHash` instead of relying on an approximate hash lookup that could reject valid addresses.
- The client now checks whether the current wallet address has passed DERO's miner-address maturity window before starting mining.
- If the address is newly registered but not ready for mining yet, the client shows about how many blocks are still needed instead of starting the miner and filling logs with `unregistered miner or you need to wait 15 mins`.

Usage:

1. Download `catfish-dero-public-windows.zip`
2. Extract it
3. Double-click `CatfishDero.exe`
4. Click `Start Mining` / `开始挖矿` manually when blocks are needed

Notice:

- This project is for learning, entertainment, technical research, and evaluation only.
- Do not use it for issuance financing, exchange matching, investment solicitation, money laundering, fraud, pyramid schemes, gambling, illegal fundraising, illegal mining, or regulatory evasion.
- This project is based on DERO HE. The upstream Research License does not grant commercial use or commercial distribution rights.
