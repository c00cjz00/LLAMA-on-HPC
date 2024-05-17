# cmd:gdown 1WaKegKk4J3cf1iHghgSRmgrt0MlWIpkq -O ./  # download 1Q23-EPR-with-Tables-FINAL.pdf
# cmd: singularity exec --nv /work/u00cjz00/nvidia/cuda118/c00cjz00_cuda11.8_pytorch_2.1.2-cuda11.8-cudnn8-devel-unstructured.sif python 51-pdf2json.py 1Q23-EPR-with-Tables-FINAL.pdf
import sys
from typing import Any
from pydantic import BaseModel
from unstructured.partition.pdf import partition_pdf

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('no argument')
        sys.exit()
    pdf_file=sys.argv[1]
    elements = partition_pdf(
        filename=pdf_file,
        extract_images_in_pdf=False,
        infer_table_structure=True,
        chunking_strategy="by_title",
        max_characters=4000,
        new_after_n_chars=3800,
        combine_text_under_n_chars=2000,
        image_output_dir_path=".",        
    )
    
    # get output as json
    from unstructured.staging.base import elements_to_json
    elements_to_json(elements, filename=f"demo.json")
