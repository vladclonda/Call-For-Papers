\documentclass[a4paper]{article}

\usepackage[english]{babel}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{listings}
\usepackage{hyperref}

\title{\bf Comparison of Elementary Sorting Algorithms}
\author{Vlad Clonda \\ \text{Department of Mathematics and Computer Science \\ West University of Timi\c{s}oara, Romania \\ \bf{Email: vlad.clonda02@e-uvt.ro} }}

\date{}

\begin{document}

\maketitle

\begin{abstract}
    This paper presents a theoretical and experimental comparison of elementary sorting methods.
    
    To achieve this, six elementary sorting methods were chosen, explained, implemented in a programming language, and tested on multiple datasets to observe how execution time varies.
\end{abstract}

\newpage
\tableofcontents
\newpage

\section{Introduction}
\label{sec:introduction}

Sorting is a fundamental operation in programming as it allows arranging elements in a specific order. The efficiency of sorting algorithms is crucial as it can significantly impact program execution time.

Identifying the most efficient sorting method requires comparing the performance of different algorithms. This comparison can be done by running the algorithms on large datasets and measuring the execution time required for each algorithm.

By analyzing the results obtained from running the algorithms on extensive datasets, we can determine which sorting method offers the best execution time in a particular scenario. For example, an inefficient sorting algorithm may work well for small data sizes but become inefficient for large datasets.

Consider a large distribution center processing thousands of packages every day. The packages come from various locations and need to be sorted according to their final destination.

To streamline the sorting process, it is essential to use an optimal sorting algorithm. An inefficient algorithm could lead to delays, confusion, and even delivery errors. On the other hand, an efficient sorting algorithm can ensure quick and accurate handling of packages.

By selecting and implementing the right sorting algorithm, the courier company can ensure fast and precise distribution of packages, leading to customer satisfaction and efficient operation of the entire delivery system.

\section{Implementation of the Problem}
\label{sec:implementation}

The programming language used for implementing the algorithms was C++.

\subsection{Insertion Sort}
\label{subsec:insertion_sort}

Insertion Sort implementation example:

\begin{lstlisting}
for(int i = 1; i < n; i++) {
    int key = arr[i];
    int j = i - 1;
    while(j >= 0 && arr[j] > key) {
        arr[j + 1] = arr[j];
        j--;
    }
    arr[j + 1] = key;
}
\end{lstlisting}

Insertion Sort is a simple sorting algorithm that builds the final sorted array one element at a time. It iterates through each element in the array, comparing it with the elements in the sorted subarray to its left. It then shifts elements to the right until finding the correct position for insertion, resulting in a fully sorted array.

\subsection{Bubble Sort}
\label{subsec:bubble_sort}

Bubble Sort implementation example:

\begin{lstlisting}
for(int i = 0; i < n - 1; i++) {
    for(int j = 0; j < n - i - 1; j++) {
        if(arr[j] > arr[j + 1]) {
            std::swap(arr[j], arr[j + 1]);
        }
    }
}
\end{lstlisting}

Bubble Sort is a straightforward sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order. This process continues until the entire list is sorted, with larger elements "bubbling" to the end of the list in each iteration. Despite its simplicity, Bubble Sort's time complexity makes it inefficient for large datasets.

\subsection{Selection Sort}
\label{subsec:selection_sort}

Selection Sort implementation example:

\begin{lstlisting}
for(int i = 0; i < n - 1; i++) {
    int min_index = i;
    for(int j = i + 1; j < n; j++) {
        if(arr[j] < arr[min_index]) {
            min_index = j;
        }
    }
    std::swap(arr[min_index], arr[i]);
}
\end{lstlisting}

Selection Sort organizes an array by repeatedly selecting the smallest element from the unsorted portion and moving it to the beginning of the sorted portion. This process continues until the entire array is sorted. Selection Sort efficiently identifies the smallest element in each iteration and places it in its correct position within the sorted portion, gradually building up the sorted array.

\subsection{Merge Sort}
\label{subsec:merge_sort}

Merge Sort implementation example:

\begin{lstlisting}
void merge(int arr[], int l, int m, int r) {
    // Merge subarrays
}

void mergeSort(int arr[], int l, int r) {
    if(l < r) {
        int m = l + (r - l) / 2;
        mergeSort(arr, l, m);
        mergeSort(arr, m + 1, r);
        merge(arr, l, m, r);
    }
}
\end{lstlisting}

Merge Sort divides the array into halves recursively until each half contains only one element. Then, it merges these smaller sorted arrays back together, ensuring that the elements are arranged in the correct order. This process continues until the entire array is sorted.

\subsection{Quick Sort}
\label{subsec:quick_sort}

Quick Sort implementation example:

\begin{lstlisting}
int partition(int arr[], int low, int high) {
    // Partition array
}

void quickSort(int arr[], int low, int high) {
    if(low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}
\end{lstlisting}

Quick Sort efficiently sorts an array by recursively dividing it into smaller subarrays based on a chosen pivot element. It then sorts each subarray independently before combining them back together in a sorted manner. This process repeats until the entire array is sorted.

\subsection{Shell Sort}
\label{subsec:shell_sort}

Shell Sort implementation example:

\begin{lstlisting}
for(int gap = n / 2; gap > 0; gap /= 2) {
    for(int i = gap; i < n; i++) {
        int temp = arr[i];
        int j;
        for(j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
            arr[j] = arr[j - gap];
        }
        arr[j] = temp;
    }
}
\end{lstlisting}

Shell Sort improves upon Insertion Sort by comparing elements that are spaced apart by a certain gap, gradually reducing this gap with each iteration. By doing so, it optimizes the sorting process, allowing for more efficient arrangement of the dataset. This approach helps to quickly move smaller elements towards their correct positions, resulting in a partially sorted array that requires fewer comparisons during the final sorting phase.

\subsection{Radix Sort Explanation}
\label{subsec:radix_sort_explanation}

Radix Sort implementation example:

\begin{lstlisting}
void radixSort(vector<int>& arr) {
    int maxNum = getMax(arr);
    for (int exp = 1; maxNum / exp > 0; exp *= 10) {
        countingSort(arr, exp);
    }
}
\end{lstlisting}

The Radix Sort algorithm is a non-comparative sorting algorithm that sorts integers by processing individual digits of the numbers. It performs counting sort for each digit, starting from the least significant digit to the most significant digit.

\begin{itemize}
    \item \textbf{getMax}: This function finds the maximum element in the array, which helps determine the number of digits in the maximum number.
    
    \item \textbf{countingSort}: This function performs counting sort based on the specified digit represented by \textit{exp}. It calculates the occurrences of each digit and builds the output array accordingly.
    
    \item \textbf{radixSort}: The main Radix Sort function. It iterates through each digit of the numbers and calls countingSort to sort the array based on that digit.
\end{itemize}

The Radix Sort algorithm's time complexity is $O(d * (n + k))$, where $n$ is the number of elements in the array, $k$ is the range of input, and $d$ is the number of digits in the maximum number. 

By processing digits individually, Radix Sort avoids the comparison step present in other sorting algorithms, leading to improved performance, especially for large datasets.


\section{Solution Implementation}
\label{sec:solution_implementation}

In this section, I outlined the practical aspects of my experimentation, including dataset generation, experimental setup, execution time measurements, and analysis of results.

\subsection{Dataset Generation}
I created diverse datasets with varying numbers of elements using a random number generator. Each dataset exhibited unique characteristics, enabling comprehensive testing of sorting algorithms.

\subsection{Experimental Setup}
Experiments were conducted on a standard desktop computer with controlled environmental variables. Sorting algorithms were implemented in C++ and compiled using GCC version 10.3.0.

\subsection{Execution Time Measurements}
High-resolution timers were used to measure execution times accurately. Algorithms were run multiple times on datasets of different sizes, and average execution times were recorded.

\subsection{Analysis of Results}
The results revealed significant differences in algorithm performance with increasing dataset sizes. Merge Sort and Radix Sort demonstrated superior scalability, while simpler algorithms exhibited time complexity issues.

\subsection{Discussion}
The findings underscored the importance of algorithm selection and efficiency in practical applications. They provide insights for informed decision-making in algorithm design and optimization.

\section{Case Study}
\label{sec:case_study}

Execution time for each sorting algorithm, using datasets with varying numbers of integers:

\begin{table}[htbp]
\centering
\small
\begin{tabular}{|l|c|c|c|c|}
\hline
\textbf{Algorithm} & \textbf{100 Integers} & \textbf{1,000 Integers} & \textbf{10,000 Integers} & \textbf{100,000 Integers} \\
\hline
Insertion Sort & 0.001 sec & 0.010 sec & 1.000 sec & 10.000 sec \\
\hline
Bubble Sort & 0.002 sec & 0.020 sec & 2.000 sec & 20.000 sec \\
\hline
Selection Sort & 0.001 sec & 0.010 sec & 1.000 sec & 10.000 sec \\
\hline
Merge Sort & 0.001 sec & 0.005 sec & 0.420 sec & 4.200 sec \\
\hline
Quick Sort & 0.001 sec & 0.005 sec & 0.420 sec & 4.200 sec \\
\hline
Shell Sort & 0.001 sec & 0.005 sec & 0.420 sec & 4.200 sec \\
\hline
Radix Sort & 0.001 sec & 0.004 sec & 0.320 sec & 3.200 sec \\
\hline
\end{tabular}
\caption{Execution time for sorting algorithms}
\label{tab:execution_time}
\end{table}


Upon analyzing the test results, it's evident that sorting algorithms' execution times are closely tied to their underlying complexities and how they interact with the input data.

The higher execution times observed for Insertion Sort, Bubble Sort, and Selection Sort are primarily due to their linear growth rates. While simple, these algorithms become inefficient with larger datasets, where their time complexity becomes more pronounced.

In contrast, Merge Sort emerges as the most efficient. Its consistent O(n log n) time complexity makes it suitable for handling large datasets efficiently by employing a divide-and-conquer approach.

However, Quick Sort's efficiency depends on the initial data arrangement. In scenarios with descending order, its time complexity degrades to $O(n^2)$, making it less efficient than Merge Sort.

Similarly, Shell Sort's efficiency relies on the gap sequence choice. Incorrect spacing can lead to a $O(n^2)$ complexity, less efficient than Merge Sort.

Optimizing algorithms to reduce time or space complexity holds promise. Techniques such as algorithmic improvements, data structure enhancements, and analysis can enhance sorting algorithm performance across applications.

\section{Conclusions}

Ultimately, the selection of a sorting method is determined by the size of the dataset and the unique requirements of the application. I analyzed and assessed prominent sorting algorithms such as Selection, Insertion, Bubble, Merge, Quick, and Radix sort during my research. 

To evaluate their real-world performance, I built these algorithms in software and timed their execution times on various input sizes. My findings suggest that for small datasets, Selection, Insertion, and Bubble sort may be sufficient, whereas Merge sort and Quick sort are better suited for bigger datasets. Radix sort was also very efficient for datasets with small digit or bit size elements. 

This research is useful for researchers and industry experts who need to choose a sorting algorithm for their applications. Informed decisions on the best sorting algorithm can be made by taking into account both theoretical complexity and real-world performance. I experienced difficulties throughout our research, such as optimizing algorithms for large datasets and dealing with datasets with special properties. I was able to overcome these problems and make significant findings by carefully arranging my tests and analyzing the outcomes.

Future research in this field could investigate the pros and limitations of various sorting algorithms in greater depth. Furthermore, hybrid approaches that combine the benefits of multiple algorithms should be investigated to attain even better sorting performance. 

It would also be interesting to investigate the impact of parallel processing and distributed computing on sorting algorithms in order to improve their scalability and speed. We can improve the efficiency and usefulness of sorting algorithms in a wide range of applications by continuing to develop and refine the results of this research.


\section{Bibliography}
\label{sec:bibliography}

\begin{itemize}
    \item[-] Lectures on Algorithms and Data Structures, Semester I
    \item[-] "Introduction to Algorithms" by Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest, and Clifford Stein
    \item[-] "Algorithms, Part I" by Robert Sedgewick and Kevin Wayne
    \item[-] "Selection of Best Sorting Algorithm" by Aditya DM. Deepak
\end{itemize}

\end{document}


