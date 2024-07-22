---
title: "Home"
description: "Home Page"
author: "Daniel Duclos-Cavalcanti"
---

# Daniel Duclos-Cavalcanti

<div id="profile-container">
    <style>
        #profile-container {
            display: flex;
            align-items: center;
        }
        #profile {
            width: 90%;
            border-radius: 50%;
            border: 2px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-right: 20px; /* Adjust the spacing between the image and text */
        }
    </style>
    <div id="profile">
        <img src="/data/images/photo.jpg" alt="Profile Image">
    </div>
    <div id="profile-text">
        <p>I'm a Computer and Electrical Engineer from the Technical University of Munich, where I'm also soon to receive a M.Sc. Degree from. Currently, I'm completing the very last credit for this program externally in <b>New York</b>, via research work in collaboration with <a href="https://anirudhsk.github.io/">Dr. Sivaraman</a> and <a href="https://haseeblums.github.io/">PhD. Haseeb Ashfaq</a> at <a href="https://news.cs.nyu.edu/">Systems@NYU</a>.
        </p>
        <p>
        The project in question revolves around <a href="https://arxiv.org/abs/2402.09527">Jasper: a Scalable and Fair Multicast Solution for Financial Exchanges in the Cloud</a>. This work leverages the current desire to migrate financial exchanges to the public cloud. Given the lack of a cloud-native multicast mechanism, Jasper presents itself as a solution. My collaboration revolves around
developing a performant heuristic to re-configure Jasper's multicast-tree based on present cloud conditions both at runtime and startup.
        </p>
    </div>
</div>


<div id="link-horizontal">
    <style>
        .list-container {
            display: flex;
            justify-content: center;
        }
        .horizontal-list {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        .horizontal-list li {
            margin-right: 15px; /* Adjust spacing as needed */
            position: relative;
            display: inline-block;
        }
        .horizontal-list li::after {
            content: "○";
            position: absolute;
            right: -10px; /* Adjust position as needed */
        }
        .horizontal-list li:last-child::after {
            content: ""; /* Remove bullet from the last item */
        }
    </style>
    <div class="list-container">
        <ul class="horizontal-list">
            <li><a href="https://github.com/duclos-cavalcanti">Github</a></li>
            <li><a href="https://www.linkedin.com/in/daniel-duclos-cavalcanti/">Linkedin</a></li>
            <li><a href="mailto:me@duclos.dev">Email</a></li>
            <li></li>
        </ul>
    </div>
</div>
