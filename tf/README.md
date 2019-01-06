## "Classic TensorFlow" code

This folder contains the script to train and test Alexnet on ImageNet. This code was developed using the classic TensorFlow framework, so defining a computational graph and then executing it in a ```tf.Session```.

### Training
To train AlexNet just run the command:
```shell
python train.py option
``` 
Without options to train the model from scratch or ```-resume``` to resume the training from a checkpoint (modify by user @train.py).

User may change the intermediate checkpoint numbers by max_to_keep=###.

The checkpoint format should be three files:
    alexnet-cnn.ckpt-#####.index
    alexnet-cnn.ckpt-#####.meta
    alexnet-cnn.ckpt-#####.data-00000-of-00001

### Testing
To evaluate the accuracy of the trained model I used the ILSVRC validation set (no test set is available). Run simply:
```shell
python test.py
```
This evaluates *Top-1* and *Top-k* (you can set *k* inside the script) accuracy and error-rate.
Inside the script you can also play with the ```K_CROPS``` parameter to see how the accuracy change when the predictions are averaged through different random crops of the images.


### Notes
```train.py``` and ```test.py``` scripts assume that ImageNet dataset folder is structured in this way:
```
ILSVRC2012
    train
        n01440764
        n01443537
        n01484850
        ...
    val
        ILSVRC2012_val_00000001.JPEG
        ILSVRC2012_val_00000002.JPEG
        ...
    data
        meta.mat
        ILSVRC2012_validation_ground_truth.txt
```
