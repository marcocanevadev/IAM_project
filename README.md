# IAM_project
Final project for IAM class.
## Abstract:
In this project, we face the task of musical genre classification by analyzing three sets of songs divided by genre and training models to accurately classify tracks based on their respective genres. The dataset consists of 18 songs, with six songs each from the following genres:
- Electronic music
- Rap music
- A set of my personal live recordings (Electronic)  

To achieve genre classification, each class is divided into training and test sets, with three songs in each category used for training and the remaining three for testing.  
We employ feature extraction techniques such as Chromagrams and MFCCs (Mel Frequency Cepstral Coefficients) to characterize the audio content effectively.  
Subsequently, the training data is used to build k-Nearest Neighbors (kNN) models for classification, with three variations of kNN considered: Chroma-based kNN, MFCC-based kNN, and a model that combines both Chroma and MFCC features.

To evaluate the model's performance, we introduce noise to the test set and compare the effectiveness of the best performing kNN model in recognizing genres before and after applying spectral subtraction to the noisy audio. Confusion matrices are utilized to assess the classification accuracy for each kNN model.
The results of our study reveal the following findings:
- Data normalization significantly improves the performance of the classification models.
- The Chroma-based kNN model demonstrates the highest accuracy among the three kNN variations.
- The introduction of noise in the test set decreases the recognition rate.
- The application of spectral subtraction on the noisy data leads to improved classification performance.
- Interestingly, the most recognized genre among the tested categories is "MySongs."
## Introduction:
Musical Genre classification falls within the domain of Music Information Retrieval (MIR) and focuses on training models to categorize musical objects based on their genres. As genres are often subjective and multifaceted, achieving consistent and accurate results in this classification task is challenging.

To classify audio objects effectively, it is essential to extract relevant features, which can be derived from either the time domain or the frequency domain.  
In this project, we concentrate on frequency domain features, specifically MFCCs and Chroma features. MFCCs capture the essential spectral characteristics of audio, while Chroma features emphasize the twelve different pitch classes present in the music.

After extracting the features, we proceed with training kNN models using the three sets of features: MFCC-based kNN, Chroma-based kNN, and the combination of both Chroma and MFCC features. The model with the highest classification accuracy is selected for further evaluation.  
To assess the models' robustness, we introduce noise to the test set with a Signal-to-Noise Ratio (SNR) of 5dB. We then use the chosen kNN model to classify the test set before and after the application of spectral subtraction, a technique used to reduce noise from audio signals.  
Throughout this report, we will delve into the details of MFCCs and Chroma features, spectral subtraction, and kNN models to comprehensively understand the genre classification process and its performance under noisy conditions.

## Project:
The project comprises of 8 scripts and several functions, each contributing to the process of musical genre classification.
- script1.m: This script is responsible for extracting Chroma and MFCCs from all the sets, including both the training and test sets. If the data has been previously analyzed, this step can be skipped by loading any file from the 'data/data_analyzed/' directory. The suggested window length for analysis is 25ms.
- script2.m: In this script, data normalization is performed, and the extracted matrices are concatenated and labeled accordingly.
- script3.m: The kNN models are trained and tested on the three sets of features (Chroma, MFCCs, and the combined Chroma+MFCCs). Similar to script1.m, this step can be skipped by loading any file from the 'data/results/' directory. The suggested window length for this process is also 25ms.
- script4.m: This script plots the recognition rate for the three sets of features and the three genres, providing a visual representation of the classification performance.
- script5.m: The primary objective of this script is to identify the best-performing kNN model for each group of features and overall.
- script6.m: Here, noise is added to the audio files, and spectral subtraction is applied. The resulting files are saved in two directories: 'data/noise_files' and 'data/noise_spec_files'.
- script7.m: This script tests the best kNN model with both the noisy and recovered files to assess the performance under such conditions.
- script8.m: The script computes confusion matrices for the three kNN models, including the noisy and recovered test data.
- untitled.m: This script is essentially script3.m in a loop.

The 'funcs' directory contains the functions required for the project, except for those found in the Audio Analysis Library. Two functions, 'specsub.m' and 'sigmerge.m,' were copy-pasted due to their intricate development. Although 'recreate.m' is currently unused, it remains included.

## Results:
After window length optimization, it was determined that a window length of 25ms provides the best results for the project.  
The results from the kNN models reveal that the Chromagram-based kNN achieves the highest performance at 46.9% accuracy with k = 250. MFCCs, on the other hand, perform slightly lower at 38.1% accuracy with k = 70. The ensemble model lies between the two, as an approximate average of their performance. These findings suggest that the addition of information (alltogether kNN) does not necessarily lead to an improvement in performance.  
While MFCCs perform relatively poorly, they still outperform random guessing (33.3%). The system should be able to learn when to utilize each set of information to maximize performance. However, kNN models, being simple, do not allow for much control and serve as a stepping stone for this type of analysis.  
The most recognized genres are "MySongs" using Chromagrams and "Electronic" using MFCCs. "MySongs" exhibit the highest recognition rate, which could be attributed to other categories including several artists, making correct classification more challenging.  
The Chromagram-trained kNN model is selected to test noisy and recovered data. As expected, the analysis of noisy data has a negative impact on performance, but the application of spectral subtraction manages to mitigate the loss by 2%.

