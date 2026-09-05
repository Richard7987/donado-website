---
layout: post
title: "Cooling slowly, and why it grows better crystals"
date: 2026-03-24 10:00:00-0600
description: "A short walk through the physics of staggered cooling in a non-vibrating granular system, equations included."
tags: granular-matter crystallization math
categories: outreach
giscus_comments: false
related_posts: false
---

*Demo post — includes real equations so the MathJax rendering can be checked.
Fernando will review and replace the text.*

In a driven granular layer, the role of temperature is played by the **granular
temperature**, the mean kinetic energy of the velocity fluctuations:

$$
T_g \;=\; \frac{1}{d}\,\big\langle\, \lvert \mathbf{v} - \langle \mathbf{v}\rangle \rvert^{2} \,\big\rangle ,
$$

with $d$ the number of spatial dimensions. Unlike a real thermostat, $T_g$ is not
something we set directly — it is the balance between the power injected by the
drive and the power dissipated in inelastic collisions. For a system of $N$ grains
that balance can be written

$$
\frac{d}{dt}\!\left( \tfrac{1}{2} N d\, T_g \right) \;=\; P_{\text{in}} \;-\; \Gamma\, T_g^{3/2},
$$

where the loss term $\Gamma\,T_g^{3/2}$ is the standard Haff form for a cooling
granular gas. Setting the left-hand side to zero gives the quasi-steady
temperature the layer sits at for a given drive,
$T_g^{\ast} = \left(P_{\text{in}}/\Gamma\right)^{2/3}$.

Whether the layer orders is then governed by a single dimensionless group,

$$
\Pi \;=\; \frac{T_g^{\ast}}{\varepsilon_{\text{cage}}},
$$

the ratio of the granular temperature to the energy $\varepsilon_{\text{cage}}$
needed to break out of the cage of nearest neighbors. For $\Pi \gg 1$ the grains
diffuse freely; for $\Pi \lesssim 1$ they are trapped. Crystals nucleate and grow
in the narrow window just above $\Pi \simeq 1$: cold enough to be ordered, still
warm enough for particles to find their lattice sites.

### Why "staggered"

If you ramp the drive down in one smooth sweep, the layer races through that
window and quenches into a glass. Instead we cut $P_{\text{in}}$ in **steps**,
holding at each level for a waiting time $\tau_w$ long enough for the local order
parameter

$$
\psi_6(\mathbf{r}) \;=\; \frac{1}{n}\sum_{j=1}^{n} e^{\,i\,6\theta_{j}}
$$

to relax before the next cut. Here $\theta_j$ is the angle of the bond to the
$j$-th of $n$ neighbors, and $\lvert \psi_6 \rvert \to 1$ in a perfect triangular
lattice. Optimizing the schedule is then a trade-off: too short a $\tau_w$ and
disorder is frozen in; too long and you have merely wasted time. In our
experiments the best final $\langle \lvert \psi_6 \rvert \rangle$ came from a
handful of steps with $\tau_w$ of order the structural relaxation time at each
stage — the granular echo of annealing a real crystal.
