<h1 align="center">prfmodel</h1>

<p align="center">
  Fits a population receptive field (pRF) model to BOLD fMRI with AFNI 3dNLfim (Conv_PRF, simplex) given a visual stimulus image, and outputs the pRF parameter bucket, fitted signal and polar magnitude and phase maps.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.598"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.598-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Fits a population receptive field (pRF) model to BOLD fMRI with AFNI 3dNLfim (Conv_PRF, simplex) given a visual stimulus image, and outputs the pRF parameter bucket, fitted signal and polar magnitude and phase maps.**

Demeans and scales the BOLD within an AFNI automask, then fits AFNI's convolved Gaussian pRF model (Conv_PRF, SPM canonical HRF) voxel-wise with 3dNLfim using a random grid search followed by simplex optimisation, with the stimulus aperture images as AFNI_MODEL_PRF_STIM_DSET. Polar magnitude and phase are derived from the fitted x and y centres. Use it for retinotopic mapping experiments with a known stimulus aperture sequence. The HRF reference is generated for a fixed 1.5 s TR, and the brain mask used is computed with 3dAutomask rather than taken from the mask input.

| | |
|---|---|
| **Inputs** | `neuro/func/task` · `neuro/stimulus` · `neuro/mask` |
| **Outputs** | `neuro/prf` |
| **Container** | `anibalsolon/bl-app-prfmodel:v0.0.1` |
| **Resources** | 16 CPUs |
| **Run it** | [doi.org/10.25663/brainlife.app.598](https://doi.org/10.25663/brainlife.app.598) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `fmri` | `neuro/func/task` | yes | Retinotopy BOLD run (the BOLD image is used; events, sbref and physio files are not used). |
| `stim` | `neuro/stimulus` | yes | Stimulus aperture image sequence matching the BOLD time points, used as the pRF stimulus dataset. |
| `mask` | `neuro/mask` | yes | Brain mask. Not used by the current code (3dAutomask of the BOLD is used instead). |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/prf` | Folder with the 3dNLfim pRF parameter bucket (Buck.PRF.nii.gz), fitted time series (snfit.PRF.nii.gz), polar magnitude and phase maps, and intermediate mean, automask and demeaned BOLD images. |

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts several Apps, each built from its own branch.

| App | Branch | Run it | Status |
|---|---|---|---|
| AFNI pRF | [`main`](https://github.com/anibalsolon/bl-app-prfmodel/tree/main) | [doi:10.25663/brainlife.app.598](https://doi.org/10.25663/brainlife.app.598) | current |
| PRFmodel | [`main`](https://github.com/anibalsolon/bl-app-prfmodel/tree/main) | [doi:10.25663/brainlife.app.589](https://doi.org/10.25663/brainlife.app.589) | available |

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.598](https://doi.org/10.25663/brainlife.app.598), choose `neuro/func/task`, `neuro/stimulus`, `neuro/mask` from your project and press **Execute**. The results are saved to your project as `neuro/prf`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `anibalsolon/bl-app-prfmodel:v0.0.1`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository and check out the App's branch (`git checkout main`).
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "bold": "/path/to/fmri/bold",
       "events": "/path/to/fmri/events",
       "events_json": "/path/to/fmri/events_json",
       "sbref": "/path/to/fmri/sbref",
       "sbref_json": "/path/to/fmri/sbref_json",
       "physio": "/path/to/fmri/physio",
       "physio_json": "/path/to/fmri/physio_json",
       "stim": "/path/to/stim/stim",
       "mask": "/path/to/mask/mask"
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- AFNI pRF. brainlife.io App. [doi:10.25663/brainlife.app.598](https://doi.org/10.25663/brainlife.app.598)
- Cox. AFNI: Software for Analysis and Visualization of Functional Magnetic Resonance Neuroimages. *Computers and Biomedical Research* 29:162-173 (1996). [doi:10.1006/cbmr.1996.0014](https://doi.org/10.1006/cbmr.1996.0014)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

Maintained by [@anibalsolon](https://github.com/anibalsolon).

## License

See [LICENSE](LICENSE).
