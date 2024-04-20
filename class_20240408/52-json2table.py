# cmd:  singularity exec --nv /work/u00cjz00/nvidia/cuda118/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel-unstructured.sif python json2table.py 1Q23-EPR-with-Tables-FINAL.pdf.json
import sys
import pandas as pd
import json

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('no argument')
        sys.exit()
    json_file=sys.argv[1]
    data = pd.read_json ( json_file )
    df = pd.DataFrame(data) # 轉成 DataFrame
    for index, row in df.iterrows():
        type=row['type']
        if type == "Table":
            print(index)
            print(row['text'])
    