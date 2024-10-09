!
! Variables
!

module all_var

  integer :: input_err
  integer :: allocate_err

  !
  !
  integer :: n_qv
  double precision,allocatable :: qv(:)
  integer :: qv_range1,qv_range2,n_qv_range
  double precision :: pi,dacos_pi

  double precision,allocatable :: exp_iv(:)
  double precision,allocatable :: exp_iv_sigma(:)

  !
  !
  integer :: n_bin
  character(len=14),allocatable :: bin_data(:)
  character(len=14) :: d_bin_data

  double precision,allocatable :: pdd0(:),pdd1(:),pdd2(:),d_pdd(:)
  double precision,allocatable :: true_pdd(:)

  !
  !
  double precision,allocatable :: bin_iv(:,:)
  double precision,allocatable :: bin_iv_ave(:),bin_iv_ave_old(:)
  double precision,allocatable :: diff_iv(:)

  double precision,allocatable :: gradient(:)
  double precision :: d_gradient

  double precision :: trans_rate,pdd_sum
  double precision :: kai2,arep
  double precision :: kld_fr0

  integer :: k_gradient,k_const
  double precision :: conf_fac

  !
  !
  integer :: n_trans,count,out_count
  
  integer,parameter :: no=1000
  integer :: n_out,out_trans(no)
  integer :: out_trans_step

  character(len=200) :: exp_file
  character(len=200) :: pdd0_file,true_pdd_file
  
  character(len=200) :: bin_header,bin_footer,bin_data_file
  integer :: bin_header_len,bin_footer_len,bin_data_file_len

  character(len=200) :: out_header
  integer :: out_header_len
  character(len=200) :: out_file1,out_file2,out_file3
  integer :: out_file1_len,out_file2_len,out_file3_len

  character(len=5) :: fno5
  character(len=8) :: fno8

  !
  !
  integer :: i,ii,iii
  integer :: j,jj,jjj
  integer :: k,kk,kkk
  integer :: l,ll,lll
  integer :: m,mm,mmm

!
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!

end module all_var


  

  
