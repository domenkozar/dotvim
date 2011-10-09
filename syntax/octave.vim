" Vim syntax file
" Language:	Octave
" Maintainer:	Francisco Castro <fcr@adinet.com.uy>
"		Original maintainer: Preben 'Peppe' Guldberg <peppe-vim@wielders.org>
"		Original author: Mario Eusebio
" Last Change:	5 Jul 2007

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

function! s:CheckForFunctions()
  let l:i = 1
  let l:prev = ''
  while l:i <= line('$')
    let l:line = l:prev . getline(l:i)
    let l:i = l:i + 1
    if match(l:line, "\\(^\\|[^\\\\]\\)\\\\$") >= 0
      let l:prev = l:line[:-2]
      continue
    else
      let l:prev = ''
    endif
    if match(l:line, 'function') == 0
      let l:line = substitute(l:line, "function *\\(.*= *\\)\\?", "", "")
      let l:nfun = substitute(l:line, "\\([A-Za-z0-9_]\\+\\).*", "\\1", "")
      execute "syn keyword octaveFunction" l:nfun
    endif
  endwhile
endfunction

call s:CheckForFunctions()

syn keyword octaveBeginKeywords for function if switch try unwind_protect while
syn keyword octaveElseKeywords case catch else elseif otherwise unwind_protect_cleanup

syn keyword octaveEndKeywords  end endfor endfunction endif endswitch
syn keyword octaveEndKeywords  end_try_catch end_unwind_protect endwhile

syn keyword octaveReserved     all_va_args break continue global gplot gsplot
syn keyword octaveReserved     replot return persistent

syn keyword octaveCommands __end__ diary isvarname set casesen echo load show
syn keyword octaveCommands cd edit_history ls type chdir format
syn keyword octaveCommands mark_as_command unmark_command clear gset
syn keyword octaveCommands mislocked which dbclear gshow mlock who dbstatus
syn keyword octaveCommands help more whos dbstop history munlock dbtype hold
syn keyword octaveCommands run_history dbwhere iskeyword save

syn keyword octaveVariables   EDITOR EXEC_PATH F_DUPFD F_GETFD F_GETFL
syn keyword octaveVariables   F_SETFD F_SETFL I IMAGEPATH INFO_FILE
syn keyword octaveVariables   INFO_PROGRAM Inf J LOADPATH NaN
syn keyword octaveVariables   OCTAVE_VERSION O_APPEND O_CREAT O_EXCL
syn keyword octaveVariables   O_NONBLOCK O_RDONLY O_RDWR O_TRUNC O_WRONLY
syn keyword octaveVariables   PAGER PS1 PS2 PS4 PWD SEEK_CUR SEEK_END
syn keyword octaveVariables   SEEK_SET __F_DUPFD__ __F_GETFD__ __F_GETFL__
syn keyword octaveVariables   __F_SETFD__ __F_SETFL__ __I__ __Inf__ __J__
syn keyword octaveVariables   __NaN__ __OCTAVE_VERSION__ __O_APPEND__
syn keyword octaveVariables   __O_CREAT__ __O_EXCL__ __O_NONBLOCK__
syn keyword octaveVariables   __O_RDONLY__ __O_RDWR__ __O_TRUNC__
syn keyword octaveVariables   __O_WRONLY__ __PWD__ __SEEK_CUR__
syn keyword octaveVariables   __SEEK_END__ __SEEK_SET__ __argv__ __e__
syn keyword octaveVariables   __eps__ __error_text__ __i__ __inf__ __j__
syn keyword octaveVariables   __nan__ __pi__ __program_invocation_name__
syn keyword octaveVariables   __program_name__ __realmax__ __realmin__
syn keyword octaveVariables   __stderr__ __stdin__ __stdout__ ans argv
syn keyword octaveVariables   automatic_replot beep_on_error
syn keyword octaveVariables   completion_append_char default_return_value
syn keyword octaveVariables   default_save_format define_all_return_values
syn keyword octaveVariables   do_fortran_indexing e echo_executing_commands
syn keyword octaveVariables   empty_list_elements_ok eps error_text
syn keyword octaveVariables   gnuplot_binary gnuplot_has_multiplot
syn keyword octaveVariables   history_file history_size
syn keyword octaveVariables   ignore_function_time_stamp
syn keyword octaveVariables   implicit_str_to_num_ok inf nan nargin
syn keyword octaveVariables   ok_to_lose_imaginary_part
syn keyword octaveVariables   output_max_field_width output_precision
syn keyword octaveVariables   page_output_immediately page_screen_output pi
syn keyword octaveVariables   prefer_column_vectors
syn keyword octaveVariables   prefer_zero_one_indexing print_answer_id_name
syn keyword octaveVariables   print_empty_dimensions
syn keyword octaveVariables   program_invocation_name program_name
syn keyword octaveVariables   propagate_empty_matrices realmax realmin
syn keyword octaveVariables   resize_on_range_error
syn keyword octaveVariables   return_last_computed_value save_precision
syn keyword octaveVariables   saving_history silent_functions
syn keyword octaveVariables   split_long_rows stderr stdin stdout
syn keyword octaveVariables   string_fill_char struct_levels_to_print
syn keyword octaveVariables   suppress_verbose_help_message
syn keyword octaveVariables   treat_neg_dim_as_zero
syn keyword octaveVariables   warn_assign_as_truth_value
syn keyword octaveVariables   warn_comma_in_global_decl warn_divide_by_zero
syn keyword octaveVariables   warn_function_name_clash
syn keyword octaveVariables   warn_missing_semicolon
syn keyword octaveVariables   whitespace_in_literal_matrix
  
syn keyword octaveTodo 			contained  TODO


" If you do not want these operators lit, uncommment them and the "hi link" below
syn match octaveLogicalOperator		"[&|~!]"
syn match octaveArithmeticOperator	"[-+]"
syn match octaveArithmeticOperator	"\.\=[*/\\^]"
syn match octaveRelationalOperator	"[=!~]="
syn match octaveRelationalOperator	"[<>]=\="

syn match octaveLineContinuation	"\.\{3}"

syn match octaveLineContinuation	"\\[ \t]*[#%]"me=e-1 
syn match octaveLineContinuation	"\\[ \t]*$" 

"syn match octaveIdentifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"


" String
syn region octaveString			start=+'+ end=+'+	oneline
syn region octaveString			start=+"+ end=+"+	oneline

" If you don't like tabs
syn match octaveTab			"\t"

" Standard numbers
syn match octaveNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match octaveFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match octaveFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
"syn match octaveDelimiter		"[][]"
syn match octaveDelimiter		"[][()]"
syn match octaveTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match octaveSemicolon	";"

syn match octaveComment		"[%#].*$"	contains=octaveTodo,octaveTab

syn keyword octaveFunction ERRNO iscntrl __end__ iscomplex __error_text__
syn keyword octaveFunction isdigit __print_symbol_info__ isempty
syn keyword octaveFunction __print_symtab_info__ isfield __token_count__
syn keyword octaveFunction isfinite abs isglobal acos isgraph acosh ishold
syn keyword octaveFunction all isieee angle isinf any iskeyword append islist
syn keyword octaveFunction arg islogical argnames islower asin ismatrix asinh
syn keyword octaveFunction isna assignin isnan atan isnumeric atan2 isprint
syn keyword octaveFunction atanh ispunct atexit isreal bitand isspace bitmax
syn keyword octaveFunction isstream bitor isstreamoff bitshift isstruct
syn keyword octaveFunction bitxor isupper casesen isvarname cat isxdigit cd
syn keyword octaveFunction kbhit ceil keyboard cell kill cell2struct lasterr
syn keyword octaveFunction cellstr lastwarn char length chdir lgamma class
syn keyword octaveFunction link clc linspace clear list clearplot clg
syn keyword octaveFunction log closeplot log10 completion_matches ls conj
syn keyword octaveFunction lstat cos mark_as_command cosh mislocked cumprod
syn keyword octaveFunction mkdir cumsum mkfifo dbclear mkstemp dbstatus mlock
syn keyword octaveFunction dbstop more dbtype munlock dbwhere nargin diag
syn keyword octaveFunction nargout diary native_float_format disp ndims
syn keyword octaveFunction do_string_escapes nth document numel double
syn keyword octaveFunction octave_config_info dup2 octave_tmp_file_name echo
syn keyword octaveFunction ones edit_history pause erf pclose erfc permute
syn keyword octaveFunction error pipe error_text popen eval printf evalin
syn keyword octaveFunction prod exec purge_tmp_files exist putenv exit puts
syn keyword octaveFunction exp pwd eye quit fclose read_readline_init_file
syn keyword octaveFunction fcntl readdir fdisp readlink feof real ferror
syn keyword octaveFunction rehash feval rename fflush reshape fgetl reverse
syn keyword octaveFunction fgets rmdir fieldnames rmfield file_in_loadpath
syn keyword octaveFunction round file_in_path run_history
syn keyword octaveFunction find_first_of_in_loadpath save finite scanf fix
syn keyword octaveFunction set floor shell_cmd fmod show fnmatch sign fopen
syn keyword octaveFunction sin fork sinh format size formula sizeof fprintf
syn keyword octaveFunction sleep fputs source fread splice freport sprintf
syn keyword octaveFunction frewind sqrt fscanf squeeze fseek sscanf ftell
syn keyword octaveFunction stat func2str str2func functions streamoff fwrite
syn keyword octaveFunction struct gamma struct2cell gammaln sum getegid sumsq
syn keyword octaveFunction getenv symlink geteuid system getgid tan getpgrp
syn keyword octaveFunction tanh getpid tilde_expand getppid tmpfile getuid
syn keyword octaveFunction tmpnam glob toascii graw tolower gset toupper
syn keyword octaveFunction gshow type help typeinfo history uint16 hold
syn keyword octaveFunction uint32 home uint64 horzcat uint8 imag umask inline
syn keyword octaveFunction undo_string_escapes input unlink input_event_hook
syn keyword octaveFunction unmark_command int16 usage int32 usleep int64
syn keyword octaveFunction va_arg int8 va_start intmax vectorize intmin
syn keyword octaveFunction vertcat ipermute vr_val is_nan_or_na waitpid
syn keyword octaveFunction isalnum warning isalpha warranty isascii which
syn keyword octaveFunction isbool who iscell whos iscellstr zeros ischar

syn keyword octaveFunction abcddim __abcddims__ acot acoth acsc acsch
syn keyword octaveFunction analdemo anova arch_fit arch_rnd arch_test are
syn keyword octaveFunction arma_rnd asctime asec asech autocor autocov
syn keyword octaveFunction autoreg_matrix axis axis2dlim __axis_label__ bar
syn keyword octaveFunction bartlett bartlett_test base2dec bddemo beep bessel
syn keyword octaveFunction beta beta_cdf betai beta_inv beta_pdf beta_rnd
syn keyword octaveFunction bin2dec bincoeff binomial_cdf binomial_inv
syn keyword octaveFunction binomial_pdf binomial_rnd bitcmp bitget bitset
syn keyword octaveFunction blackman blanks bode bode_bounds __bodquist__
syn keyword octaveFunction bottom_title bug_report buildssic c2d cart2pol
syn keyword octaveFunction cart2sph cauchy_cdf cauchy_inv cauchy_pdf
syn keyword octaveFunction cauchy_rnd cellidx center chisquare_cdf
syn keyword octaveFunction chisquare_inv chisquare_pdf chisquare_rnd
syn keyword octaveFunction chisquare_test_homogeneity
syn keyword octaveFunction chisquare_test_independence circshift clock
syn keyword octaveFunction cloglog close coeff colormap columns com2str
syn keyword octaveFunction common_size commutation_matrix compan complement
syn keyword octaveFunction computer cond contour controldemo conv cor
syn keyword octaveFunction corrcoef cor_test cot coth cov cputime create_set
syn keyword octaveFunction cross csc csch ctime ctrb cut d2c damp dare date
syn keyword octaveFunction dcgain deal deblank dec2base dec2bin dec2hex
syn keyword octaveFunction deconv delete DEMOcontrol demoquat detrend dezero
syn keyword octaveFunction dgkfdemo dgram diff diffpara dir discrete_cdf
syn keyword octaveFunction discrete_inv discrete_pdf discrete_rnd dkalman
syn keyword octaveFunction dlqe dlqg dlqr dlyap dmr2d dmult dot dre
syn keyword octaveFunction dump_prefs duplication_matrix durbinlevinson
syn keyword octaveFunction empirical_cdf empirical_inv empirical_pdf
syn keyword octaveFunction empirical_rnd erfinv __errcomm__ errorbar
syn keyword octaveFunction __errplot__ etime exponential_cdf exponential_inv
syn keyword octaveFunction exponential_pdf exponential_rnd f_cdf fftconv
syn keyword octaveFunction fftfilt fftshift figure fileparts findstr f_inv
syn keyword octaveFunction fir2sys flipdim fliplr flipud flops f_pdf
syn keyword octaveFunction fractdiff frdemo freqchkw __freqresp__ freqz
syn keyword octaveFunction freqz_plot f_rnd f_test_regression fullfile fv fvl
syn keyword octaveFunction gamma_cdf gammai gamma_inv gamma_pdf gamma_rnd
syn keyword octaveFunction geometric_cdf geometric_inv geometric_pdf
syn keyword octaveFunction geometric_rnd get_fmt gls gram gray gray2ind grid
syn keyword octaveFunction h2norm h2syn hamming hankel hanning hex2dec hilb
syn keyword octaveFunction hinf_ctr hinfnorm hinfsyn hinfsyn_chk hinfsyn_ric
syn keyword octaveFunction hist hotelling_test hotelling_test_2 housh hsv2rgb
syn keyword octaveFunction hurst hypergeometric_cdf hypergeometric_inv
syn keyword octaveFunction hypergeometric_pdf hypergeometric_rnd image
syn keyword octaveFunction imagesc impulse imshow ind2gray ind2rgb ind2sub
syn keyword octaveFunction index int2str intersection invhilb iqr irr isa
syn keyword octaveFunction is_abcd is_bool is_complex is_controllable
syn keyword octaveFunction isdefinite is_detectable is_dgkf is_digital
syn keyword octaveFunction is_duplicate_entry is_global is_leap_year isletter
syn keyword octaveFunction is_list is_matrix is_observable ispc is_sample
syn keyword octaveFunction is_scalar isscalar is_signal_list is_siso
syn keyword octaveFunction is_square issquare is_stabilizable is_stable isstr
syn keyword octaveFunction is_stream is_struct is_symmetric issymmetric
syn keyword octaveFunction isunix is_vector isvector jet707 kendall
syn keyword octaveFunction kolmogorov_smirnov_cdf kolmogorov_smirnov_test
syn keyword octaveFunction kolmogorov_smirnov_test_2 kruskal_wallis_test
syn keyword octaveFunction krylov krylovb kurtosis laplace_cdf laplace_inv
syn keyword octaveFunction laplace_pdf laplace_rnd lcm lin2mu listidx
syn keyword octaveFunction list_primes loadaudio loadimage log2 logical
syn keyword octaveFunction logistic_cdf logistic_inv logistic_pdf
syn keyword octaveFunction logistic_regression_derivatives
syn keyword octaveFunction logistic_regression_likelihood logistic_rnd logit
syn keyword octaveFunction loglog loglogerr logm lognormal_cdf lognormal_inv
syn keyword octaveFunction lognormal_pdf lognormal_rnd logspace lower lqe lqg
syn keyword octaveFunction lqr lsim ltifr lyap mahalanobis manova
syn keyword octaveFunction mcnemar_test mean meansq median menu mesh meshdom
syn keyword octaveFunction meshdom meshgrid minfo mod moddemo moment mplot
syn keyword octaveFunction mu2lin multiplot nargchk nextpow2 nichols norm
syn keyword octaveFunction normal_cdf normal_inv normal_pdf normal_rnd not
syn keyword octaveFunction nper npv ntsc2rgb null num2str nyquist obsv ocean
syn keyword octaveFunction ols oneplot ord2 orth __outlist__ pack packsys
syn keyword octaveFunction parallel pascal_cdf pascal_inv pascal_pdf
syn keyword octaveFunction pascal_rnd path periodogram perror place playaudio
syn keyword octaveFunction plot plot_border __plr__ __plr1__ __plr2__ __plt__
syn keyword octaveFunction __plt1__ __plt2__ __plt2mm__ __plt2mv__ __plt2ss__
syn keyword octaveFunction __plt2vm__ __plt2vv__ __pltopt__ __pltopt1__ pmt
syn keyword octaveFunction poisson_cdf poisson_inv poisson_pdf poisson_rnd
syn keyword octaveFunction pol2cart polar poly polyder polyderiv polyfit
syn keyword octaveFunction polyinteg polyout polyreduce polyval polyvalm
syn keyword octaveFunction popen2 postpad pow2 ppplot prepad probit prompt
syn keyword octaveFunction prop_test_2 pv pvl pzmap qconj qcoordinate_plot
syn keyword octaveFunction qderivmat qderivmat qinv qmult qqplot qtrans
syn keyword octaveFunction qtransv qtransvmat quaternion qzhess qzval
syn keyword octaveFunction randperm range rank ranks rate record rectangle_lw
syn keyword octaveFunction rectangle_sw rem repmat residue rgb2hsv rgb2ind
syn keyword octaveFunction rgb2ntsc rindex rldemo rlocus roots rot90 rotdim
syn keyword octaveFunction rotg rows run_count run_test saveaudio saveimage
syn keyword octaveFunction sec sech semilogx semilogxerr semilogy semilogyerr
syn keyword octaveFunction series setaudio setstr shg shift shiftdim
syn keyword octaveFunction sign_test sinc sinetone sinewave skewness sombrero
syn keyword octaveFunction sortcom spearman spectral_adf spectral_xdf spencer
syn keyword octaveFunction sph2cart split ss ss2sys ss2tf ss2zp stairs starp
syn keyword octaveFunction statistics std stdnormal_cdf stdnormal_inv
syn keyword octaveFunction stdnormal_pdf stdnormal_rnd step __stepimp__ stft
syn keyword octaveFunction str2mat str2num strappend strcat strcmp strerror
syn keyword octaveFunction strjust strrep struct_contains struct_elements
syn keyword octaveFunction studentize sub2ind subplot substr subwindow swap
syn keyword octaveFunction swapcols swaprows sylvester_matrix synthesis
syn keyword octaveFunction sys2fir sys2ss sys2tf sys2zp sysadd sysappend
syn keyword octaveFunction syschnames __syschnamesl__ syschtsam __sysconcat__
syn keyword octaveFunction sysconnect syscont __syscont_disc__
syn keyword octaveFunction __sysdefioname__ __sysdefstname__ sysdimensions
syn keyword octaveFunction sysdisc sysdup sysgetsignals sysgettsam sysgettype
syn keyword octaveFunction sysgroup __sysgroupn__ sysidx sysmin sysmult
syn keyword octaveFunction sysout sysprune sysreorder sysrepdemo sysscale
syn keyword octaveFunction syssetsignals syssub sysupdate table t_cdf tempdir
syn keyword octaveFunction tempname texas_lotto tf tf2ss tf2sys __tf2sysl__
syn keyword octaveFunction tf2zp __tfl__ tfout theta tic t_inv title toc
syn keyword octaveFunction toeplitz top_title t_pdf trace triangle_lw
syn keyword octaveFunction triangle_sw tril triu t_rnd t_test t_test_2
syn keyword octaveFunction t_test_regression tzero tzero2 ugain uniform_cdf
syn keyword octaveFunction uniform_inv uniform_pdf uniform_rnd union unix
syn keyword octaveFunction unpacksys unwrap upper u_test values vander var
syn keyword octaveFunction var_test vec vech version vol weibull_cdf
syn keyword octaveFunction weibull_inv weibull_pdf weibull_rnd welch_test
syn keyword octaveFunction wgt1o wiener_rnd wilcoxon_test xlabel xor ylabel
syn keyword octaveFunction yulewalker zgfmul zgfslv zginit __zgpbal__
syn keyword octaveFunction zgreduce zgrownorm zgscal zgsgiv zgshsr zlabel zp
syn keyword octaveFunction zp2ss __zp2ssg2__ zp2sys zp2tf zpout z_test
syn keyword octaveFunction z_test_2 

syn keyword octaveImplicit abs cos is_nan_or_na isnan sign acos cosh isalnum
syn keyword octaveImplicit isprint sin acosh erf isalpha ispunct sinh angle
syn keyword octaveImplicit erfc isascii isspace sqrt arg exp iscntrl isupper
syn keyword octaveImplicit tan asin finite isdigit isxdigit tanh asinh fix
syn keyword octaveImplicit isfinite lgamma toascii atan floor isgraph log
syn keyword octaveImplicit tolower atanh gamma isinf log10 toupper ceil
syn keyword octaveImplicit gammaln islower real conj imag isna round

syn match octaveError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match octaveError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_octave_syntax_inits")
  if version < 508
    let did_octave_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  
  HiLink octaveBeginKeywords		Conditional
  HiLink octaveElseKeywords		Conditional
  HiLink octaveEndKeywords		Conditional
  HiLink octaveReserved			Conditional

  HiLink octaveCommands			Statement

  HiLink octaveTransposeOperator	octaveOperator
"  HiLink octaveOperator			Operator
  HiLink octaveLineContinuation		Special
  HiLink octaveLabel			Label
  HiLink octaveConditional		Conditional
  HiLink octaveRepeat			Repeat
  HiLink octaveTodo			Todo
  HiLink octaveString			String
  HiLink octaveDelimiter		Identifier
  HiLink octaveTransposeOther		Identifier
  HiLink octaveNumber			Number
  HiLink octaveFloat			Float
  HiLink octaveFunction			Function
  HiLink octaveError			Error
  HiLink octaveImplicit			octaveStatement
  HiLink octaveStatement		Statement
  HiLink octaveSemicolon		SpecialChar
  HiLink octaveComment			Comment

  HiLink octaveArithmeticOperator	octaveOperator
  HiLink octaveRelationalOperator	octaveOperator
  HiLink octaveLogicalOperator		octaveOperator

"optional highlighting
  "HiLink octaveIdentifier		Identifier
  "HiLink octaveTab			Error

  delcommand HiLink
endif

let b:current_syntax = "octave"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
