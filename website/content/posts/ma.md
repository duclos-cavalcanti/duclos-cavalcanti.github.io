---
title: "Master-Thesis"
date: 2024-10-22T02:01:58+05:30
description: "Master Thesis"
tags: [research, cloud]
---

After a challenging year I finally defended my master thesis on __"VM Selection for Financial Exchanges in the Cloud"__.
This collaborative effort was done as my master's degree final credit at my alma mater the [Technical University of Munich](https://www.tum.de/). Throughout this work I was by 
co-advised by 
[PhD. Muhammad Haseeeb](https://haseeblums.github.io/) and [Dr.Anirudh Sivaraman](https://anirudhsk.github.io/) from [Systems@NYU](https://news.cs.nyu.edu/), as well as 
[PhD. Navidreza Asadi](https://nrasadi.github.io/) and [Prof. Dr.-Ing. Wolfgang Kellerer](https://www.ce.cit.tum.de/en/lkn/team/staff/kellerer-wolfgang/) from  [LKN](https://www.ce.cit.tum.de/en/lkn/home/) at TUM.
The entirety of the code and relevant documentation can be found on [github](https://github.com/duclos-cavalcanti/TreeBuilder).

![title](/data/images/MA_Design.png)


### Abstract
Cloud computing has revolutionized the deployment of software services by providing vir-
tualized computational resources rented on-demand. Financial exchanges are exploring the
potential of migrating to the cloud for improved scalability and reduced costs. However,
the cloud’s inherent variance in network performance and lack of native multicast solutions
present challenges to achieving fair and low-latency data dissemination, which are essential
for modern exchanges.

Jasper is a pioneering project that implements a multicast solution for cloud-based financial
exchanges. It achieves ultra-low latency through an overlay proxy tree structure, kernel
bypassing, clock synchronization, and more. However, Jasper does not fully address the
issue of ”stragglers” – underperforming virtual machines (VMs) within a cluster – which
can significantly degrade system performance.

This work introduces TreeBuilder, a tool designed to enhance Jasper’s approach by 
intelligently selecting nodes in a pool to form a multicast tree, specifically addressing the
presence of straggler VMs. TreeBuilder employs straightforward heuristics to improve la-
tency performance while maintaining a flexible and modular architecture that allows for
incremental updates and easy adaptation to other network topologies. We implement sev-
eral selection strategies, including WEIGHTED, P90, and P50, to evaluate their impact on a
multicast tree’s performance.

Through extensive experiments, we demonstrate that TreeBuilder performs comparably
to LemonDrop, a recent and sophisticated VM selection and scheduling heuristic, while
maintaining a lightweight, effective technique with considerable scalability. An instance
of TreeBuilder’s BEST-WEIGHTED tree exhibited the lowest 90th percentile latency for its
worst receiver at 312 μs, approximately 7.7% lower than the worst receiver of LemonDrop’s
tree (LEMON), which had a latency of 338 μs. Similarly, the BEST-WEIGHTED tree’s worst
receiver’s mean latency was 223.1 μs, around 10.6% lower than that of LEMON at 249.5
μs. However, LemonDrop’s tree exhibited lower standard deviation values throughout
the experiment, indicating a more stable system due to its median-based optimization
approach. In conclusion, TreeBuilder offers an accessible, extensible solution for multicast
dissemination in cloud environments, with significant potential for further optimization
and application to broader distributed architectures.
