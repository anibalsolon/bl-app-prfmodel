<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Fits population receptive field (pRF) models to task fMRI with AFNI 3dNLfim (Conv_PRF model) using a stimulus aperture dataset, producing pRF parameter maps and polar magnitude and phase maps.**

Demeans the BOLD series within an automask, builds an SPM canonical HRF reference with 3dDeconvolve, and fits AFNI's convolved pRF model voxel-wise with 3dNLfim (simplex search, 10000 random starts), then derives polar magnitude and phase from the x/y parameters. Use it for retinotopic mapping when a stimulus aperture movie matching the BOLD timing is available. The stimulus_diameter parameter is not read by main, and the README is empty.

| | |
|---|---|
| 📥 **Inputs** | `neuro/func/task` · `neuro/stimulus` |
| 📤 **Outputs** | `neuro/prf` |
| 🐳 **Container** | `anibalsolon/bl-app-prfmodel:v0.0.1` |
| ⚙️ **Resources** | 16 CPUs |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.589](https://doi.org/10.25663/brainlife.app.589) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `fmri` | `neuro/func/task` | yes | Task BOLD fMRI time series (with optional events). |
| `stimuli` | `neuro/stimulus` | yes | Stimulus aperture dataset used as the pRF stimulus (AFNI_MODEL_PRF_STIM_DSET). Must have the same number of time points as the BOLD series. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `prf` | `neuro/prf` | pRF fit outputs: parameter bucket, fitted time series, and polar magnitude and phase maps. |

<details>
<summary><b>⚙️ Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `stimulus_diameter` | number |  | Diameter of the circle within which apertures are shown |

</details>

<!-- brainlife-app:end -->

# PRFmodel