# 相關安裝套件
# pip install pandas json
import opencc
import pandas as pd
import json
# s2t: 簡體到正體, s2twp:簡體到台灣正體
op_cc=opencc.OpenCC('s2twp')



## 取代字元
NAME = "c00cjz00"
AUTHOR = "國網中心"
with open("15a-SFT_identity.json", "r", encoding="utf-8") as f:
  dataset = json.load(f)

for sample in dataset:
  sample["output"] = sample["output"].replace("NAME", NAME).replace("AUTHOR", AUTHOR)

with open("identity.json", "w", encoding="utf-8") as f:
  json.dump(dataset, f, indent=2, ensure_ascii=False)


# JSON資料集
input_file="identity.json"
data = pd.read_json ( input_file )
df = pd.DataFrame(data) # 轉成 DataFrame

# 轉檔
extracted_dataset = []
for index, row in df.iterrows():
    instruction = op_cc.convert(row['instruction'])
    input = op_cc.convert(row['input'])     
    output = op_cc.convert(row['output'])     
    extracted_data = {
        "instruction": instruction,
        "input":  input,
        "output": output,
        "system":  "You are a helpful AI assistant built by NCHC. The user you are helping speaks Traditional Chinese and comes from Taiwan."                
    }
    
    extracted_dataset.append(extracted_data)

# 內容寫進檔案
with open("data.json", "wt", encoding="UTF-8") as fp:
    json.dump(extracted_dataset, fp, ensure_ascii=False, indent=4) 

