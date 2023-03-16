This file details text memo formats for various operations. All memos are pipe-delineated. Memos are listed below as items, the whole of which combine to form a final transaction memo and should never exceed 28 bytes.

For example:

- ``Test'' or ``Case''
- Price
- Color

could translate to the memo: ``Test|32.2212122|Violet''



## Memo formats for various investor operations

### 


## Issuing memos

### {New/IPO} stock

- {S-{formType}||A-1} ({regFile#wDash})

todo: Consider date used here for expiration of offering doc, ditto for private.

### New private stock

- ({CIKwithoutLeadingZeros})




## Memo formats for various internal/issuer operations, todo: move to proper repo

### Share grants

- Original basis price or ``uncovered'' or ``DWAC''
- Purchase date or ``''

Where DWAC transactions have the price associated with their paging token which is stored as a data object in  DIST_DATA_TOML. # todo: Need to move production databases to Dynamo eventually, possible caches too

### Paging tokens


### Chief memo cache

- OfferID cached or distribution paging token
- Investor public key

