# Virtual-source-width-perception

**Experiment 1 : VSWe perception of Natural vs
Synthetic Vowel**

**Experiment 2  : VSWe perception of synthetic white noise vowels**

**Experiment 3 : Role of NFD in the delocalisation of shaped noise vowels**


    
* **Code**
	* DATA + PLOTS

		*	expt_data/all_expt_data.mat contains reading for all listeners and for all 3 experiments.
		*	Expt 1 is in the format :<br/>
		[ <br/>
		VSWe of Natural /a/ <br/>
		 VSWe of Natural /i/	<br/>
		 VSWe of Natural /u/	<br/>
		 VSWe of Synthetic /a/	<br/>
		VSWe of Synthetic /i/	<br/>
		VSWe of Synthetic /u/	<br/>
		]	<br/>

		*	Expt 2 and Expt 3 are in the format :<br/>
				[<br/>
			VSWe of Source1/a/ <br/>
			 VSWe of Source2/a/	<br/>
			 VSWe of Source1/i/	<br/>
			 VSWe of Source2/i/	<br/>
			VSWe of Source1/u/	<br/>
			 VSWe of Source2/u/	<br/>
			]	<br/>
		* create_data.m has the code to plot these experiment results.
	* MAIN EXPERIMENTS
		*	The nomenclature of the experiments is different in this folder. Each folder contains the GUI and the stimuli for the respective experiment.
		*	Expt1 - VSWe of natural vs synthetic vowels
		*	Expt2 -  VSWe of shaped noisy vowels. Full band white gaussian noise is added to the excitation of vowel. Width is kept a constant and NFD is varied.
		*	Expt4 - VSWe of white noise vowels. Full band white gaussian noise is added to the generated vowel.Width is varied and SNR is constant.
		*	Expt3 - deprecated code
	*	ALLstimuli
		*	It contains the stimuli generated at each intermediate step which includes - single channel, 6 channel, with duration correction and with loudness, loudspeaker calibrated.

	*	Allfigures
		*	Contains the graphs and figures that were used to make inferences about the generated stimuli.

	*	Fm_analysis
		*	This folder contains the code to perform AM-FM analysis using ZC-KNN technique. It uses the Auditory toolbox from  Malcolm Slaney to create the filter-bank.

	*	Vowel_check
		*	This folder contains multichannel files to test the working of the loudspeaker array.

	*	New_diph
		*	Diphthongs and pitch change were a part of the proposed experiments. This folder contains the multi-channel files having A-I diphthong with and without pitch change.

	*	Coeffs
		*	Contains .mat files containing the co-efficients of the filter to compensate the loudspeakers.
	*	Instruments
		*	Contains multi-channel instrument files - used for training the listener

	*	Expt_wgn_bandwidthmod
		*	In this experiment, the noise is filtered using the vowel filter and then added to the excitation. The bandwidth of the added noise is varied across trials and the SNR is varied within the trial.
	*	Results_analysis
		*	Contains preliminary results obtained by the experiments conducted by the experimenter.

	*	play_8chn.py
		*	Plays multi-channel files through a multi-channel output.
	*	var_data_exp2.m
		*	Contains the adjustable parameters to tweak vowel synthesis. 
	*	fit_lp.m
		*	Calcluates the NFD by fitting polynomials to quantization noise floor of the noiseless vowel and noise floor of the shaped noisy vowel.
		*	Input : Vowel signal, sampling frequency, vowel(a/i/u), modsigma(usually = 1)
		*	Output : NFD
	*	synthesis_vowel_nonoise2.m
		*	It is used in fit_lp.m to create a baseline polynomial fit to the quantization noise floor of a noiseless vowel.
		*	Input : dummy file name, vowel(a/i/u), modsigma(usually = 1)
		*	Output : Polynomial co-efficients of polynomial fit to the quantization noise floor of a noiseless vowel.
	*	synthesis_vowel_wgn.m
		*	Creates the shaped noisy vowel
		*	Input : file name, required NFD(decided by plot of input SNR vs Actual NFD), vowel(a/i/u), modsigma(usually = 1)
		*	Output : Creates the shaped noisy vowel and stores it with given file name, also returns the output SNR level
	*	find_formants.m
		*	Find the formant frequencies and formant bandwidths for a stationary signal
		*	Uses as LP order =20
		*	Input : Given in the audioread statement
		*	Output : Formant frequencies and bandwidths are printed
	*	synthesis_vowel_wgn_noisy.m
		*	Creates the synthetic white noise vowel
		*	Input : file name, required SNR, vowel(a/i/u), modsigma(usually = 1)
		*	Output : Creates the synthetic white noise vowel and stores it with given file name
	*	vowel_envelope_plot.m
		*	Input : reconst1 variable containing the vowel signal
		*	Output : A plot of the vowel envelope
	*	corrected.m
		*	Compensates the input files w.r.t to the loudspeakers used using the co-efficients of the filter designed and stores in “coeffs”
	*	decorrelation_values.mat
		*	Contains the phase delays used in the multi-channel stimuli
	*	duration_normalize.m
		*	Contains the code to normalize the duration of the presented stimuli
	*	generated_decorrelated_signals.m
		*	Creates multi-channel stimuli from signal channel input.
		*	Normalizes the duration
		*	Compensates the stimuli for the loudspeakers used.
	*	loudness_normaliser.m
		*	Scales the multi-channel input sound file so as to roughly normalize the loudness.
	*	synthesis_vowel_no_noise_diph
		*	Synthesises diphthongs
		*	Input : file name, vowel 1 , vowel 2
		*	Output : Creates the diphthong and stores it with given file name
	*	fftplotofvowel.m
		*	Input : reconst1 variable containing the vowel signal
		*	Plots the vowel along with its envelope
	*	genH1_vowel.m
		*	It is a subroutine used by all synthesis_vowel functions to create the vowel filter and convolute the excitation and designed filter.
	*	plot_fft.m
		*	Input : Any signal and sampling frequency
		*	Output : PLots the FFT of the signal in log-scale.
	*	synthesis_vowel_with_noise_formants
		*	Used to synthesise vowels which have vowel shaped noise added at the excitation.
	*	input_output_SNR.m
		*	Since there is no direct direct relation between SNR and NFD(because of stochastic nature of filtered noise), a plot was designed to estimate the output SNR values for various input SNR values.
	*	gen_formant_noise.m
		*	Used by synthesis_vowel_with_noise_formants.m to synthesise noise filtered with the vowel filter
	*	fig_edits.m
		*	Contains code to standardize figure plots for Latex.
	*	genH2_ImpResp.m
		*	It is a subroutine used by synthesis_vowel_no_noise_diph to create the non-stationary vowel filter and convolute the excitation and designed filter.
	*	bw_adjust_instantaneous.m
		*	It is a subroutine used by synthesis_vowel_no_noise_diph to interpolate between the bandwidths of one vowel to the other.
	*	synthesis_vowel2.m
		*	Vowel syntheised with band pass noise added to excitation 
	*	synthesis_vowel_no_noise.m
		*	Most basic vowel synthesis without any noise
	*	filterparams.m
		*	Used to calculate the pass band and stop band frequencies given a centre frequency and bandwidth.
	*	lowpass8000.mat
		*	Contains the co-efficients of a low pass filter with cutoff frequency  = 8000Hz
	*	python_play_v1.py
		*	Plays multi-channel files through a multi-channel output.
	*	fn_pos.m
		*	Used to edit figure plots 
	*	getpitch1.m
		*	Used by all synthesis vowel functions to generate the excitation to the source filter model.
	*	pitch_glide_linear
		*	Used to produce non-stationary excitation for vowels with pitch change
	*	bw_adjust.m
		*	Used to produce the formant bandwidths when they are not explicitly available
	*	ramp_fix.m
		*	Mellows the start and the end of the generated vowel




