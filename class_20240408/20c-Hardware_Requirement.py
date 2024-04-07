from transformers import AutoModel
from deepspeed.runtime.zero.stage_1_and_2 import estimate_zero2_model_states_mem_needs_all_live
from deepspeed.runtime.zero.stage3 import estimate_zero3_model_states_mem_needs_all_live

model = AutoModel.from_pretrained("meta-llama/Llama-2-7b-hf")
estimate_zero2_model_states_mem_needs_all_live(model, num_gpus_per_node=1, num_nodes=1)
estimate_zero2_model_states_mem_needs_all_live(model, num_gpus_per_node=2, num_nodes=1)
estimate_zero2_model_states_mem_needs_all_live(model, num_gpus_per_node=4, num_nodes=1)
estimate_zero2_model_states_mem_needs_all_live(model, num_gpus_per_node=8, num_nodes=1)
estimate_zero2_model_states_mem_needs_all_live(model, num_gpus_per_node=8, num_nodes=2)

estimate_zero3_model_states_mem_needs_all_live(model, num_gpus_per_node=1, num_nodes=1)
estimate_zero3_model_states_mem_needs_all_live(model, num_gpus_per_node=2, num_nodes=1)
estimate_zero3_model_states_mem_needs_all_live(model, num_gpus_per_node=4, num_nodes=1)
estimate_zero3_model_states_mem_needs_all_live(model, num_gpus_per_node=8, num_nodes=1)
estimate_zero3_model_states_mem_needs_all_live(model, num_gpus_per_node=8, num_nodes=2)