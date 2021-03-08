import numpy as np


def getMBTI(test_key, isperson):
    if isperson == "true":
        result_key = np.load('UHG/getMBTI/pr_result_key.npy', allow_pickle=True)
        result_value = np.load('UHG/getMBTI/pr_result_value.npy', allow_pickle=True)
    else:
        result_key = np.load('UHG/getMBTI/dog_result_key.npy', allow_pickle=True)
        result_value = np.load('UHG/getMBTI/dog_result_value.npy', allow_pickle=True)

    answer_key = list(map(int, test_key[1:-1].split(',')))
    answer_key = np.array(answer_key)
    comp_key = result_key == answer_key

    for n, i in enumerate(comp_key):
        if np.all(i):
            return result_value[n]