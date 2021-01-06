import numpy as np

def getMBTI(test_key):
    result_key = np.load('./result_key.npy')
    result_value = np.load('./result_value.npy')
    
    test_key = np.array(test_key)
    comp_key = result_key == test_key
    
    for n,i in enumerate(comp_key):
        if np.all(i==True) == True:
            return(result_value[n])