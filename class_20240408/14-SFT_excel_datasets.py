# 相關安裝套件
# pip install openpyxl
import json
import openpyxl

# Excel資料集
input_file="14-SFT_MedQA2019.xlsx"
wb = openpyxl.load_workbook(input_file)
sheet = wb["DrugQA"]

# 轉檔
extracted_dataset = []
for row in sheet.iter_rows(min_row=2, max_col=4, values_only=True):
    extracted_data = {
        "instruction": "你是個知識豐富的人工智慧助手，使用者將以中文向你提問，你將根據你的知識用中文來如實回答問題",
        "input":  row[0],
        "output": row[3]        
    }
    extracted_data = {
        "instruction": row[0],
        "input":  "",
        "output": row[3],      
        "system":  "You are a helpful AI assistant built by NCHC. The user you are helping speaks Traditional Chinese and comes from Taiwan."        
    }    
    
    extracted_dataset.append(extracted_data)

# 內容寫進檔案
with open("data.json", "wt", encoding="UTF-8") as fp:
    json.dump(extracted_dataset, fp, ensure_ascii=False, indent=4) 

