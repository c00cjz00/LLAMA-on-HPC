# 相關安裝套件
# pip install opencc opencc-python-reimplemented datasets
import json
import opencc
from datasets import load_dataset

# s2t: 簡體到正體, s2twp:簡體到台灣正體
op_cc=opencc.OpenCC('s2twp')

# HF資料集 Example01
#dataset_dict = load_dataset(
#    "Hello-SimpleAI/HC3-Chinese",
#    "baike",  # 選擇 baike 子集
#    cache_dir="cache",  # 方便清理
#    streaming=True,  # 啟用此選項，避免整份資料集被下載到硬碟裡面
#)

# HF資料集 Example02
dataset_dict = load_dataset(
    "ticoAg/Chinese-medical-dialogue",
    cache_dir="cache",  # 方便清理
    streaming=True,  # 啟用此選項，避免整份資料集被下載到硬碟裡面
)

dataset = dataset_dict['train']

# 轉檔
extracted_dataset = []
for _, data in zip(range(1000), dataset):
#for data in dataset:
    extracted_data = {
        "instruction":  op_cc.convert(data["instruction"]),    
        "input":  op_cc.convert(data["input"]),
        "output":  op_cc.convert(data["output"]),        
        "system":  "You are a helpful AI assistant built by NCHC. The user you are helping speaks Traditional Chinese and comes from Taiwan."        
    }

    extracted_dataset.append(extracted_data)

# 內容寫進檔案
with open("data.json", "wt", encoding="UTF-8") as fp:
    json.dump(extracted_dataset, fp, ensure_ascii=False, indent=4) 

