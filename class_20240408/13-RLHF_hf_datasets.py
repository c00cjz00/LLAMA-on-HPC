# 相關安裝套件
# pip install opencc opencc-python-reimplemented datasets
import json
import opencc
from datasets import load_dataset

# s2t: 簡體到正體, s2twp:簡體到台灣正體
op_cc=opencc.OpenCC('s2twp')

# HF資料集 Example01
dataset_dict = load_dataset(
    "LawChat-tw/RLHF_data",
    cache_dir="cache",  # 方便清理
    streaming=True,  # 啟用此選項，避免整份資料集被下載到硬碟裡面
)

# HF資料集 Example02
#dataset_dict = load_dataset(
#    "erhwenkuo/wikipedia-zhtw", 
#    "20231001",
#    cache_dir="cache",  # 方便清理
#    streaming=True,  # 啟用此選項，避免整份資料集被下載到硬碟裡面
#)


dataset = dataset_dict['train']

# 轉檔
extracted_dataset = []
for _, data in zip(range(1000), dataset):
#for data in dataset:
    extracted_data = {
        "question": data["prompt"],
        "answer": [data["chosen"],data["rejected"]],
        "system": "You are an AI assistant. You will be given a task. You must generate a detailed and long answer."

    }

    extracted_dataset.append(extracted_data)

# 內容寫進檔案
with open("data.json", "wt", encoding="UTF-8") as fp:
    json.dump(extracted_dataset, fp, ensure_ascii=False, indent=4) 

