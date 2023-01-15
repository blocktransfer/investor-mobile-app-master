This file details text memo formats for various operations. All memos are pipe-delineated. Memos are listed below as items, the whole of which combine to form a final transaction memo and should never exceed 28 bytes.

For example:

- ``Test''
- Price
- Color

would translate to the memo: Test|32.2212122|Violet



## Memo formats for various investor operations

### 









## Memo formats for various internal/issuer operations, todo: move to proper repo

### Share grants

- Original basis price or ``uncovered'' or ``DWAC''
- Purchase date or ``''

Where DWAC transactions have the price associated with their paging token which is stored as a data object in the BT_DIST account.