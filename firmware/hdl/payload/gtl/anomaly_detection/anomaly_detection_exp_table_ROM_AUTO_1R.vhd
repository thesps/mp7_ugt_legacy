-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity anomaly_detection_exp_table_ROM_AUTO_1R is 
    generic(
             DataWidth     : integer := 17; 
             AddressWidth     : integer := 10; 
             AddressRange    : integer := 1024
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          address1      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(DataWidth-1 downto 0);
          address2      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce2       : in std_logic; 
          q2         : out std_logic_vector(DataWidth-1 downto 0);
          address3      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce3       : in std_logic; 
          q3         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of anomaly_detection_exp_table_ROM_AUTO_1R is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
signal address1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
signal address2_tmp : std_logic_vector(AddressWidth-1 downto 0); 
signal address3_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem0 : mem_array := (
    0 to 24=> "00000000000000000", 25 to 94=> "00000000000000001", 
    95 to 127=> "00000000000000010", 128 to 148=> "00000000000000011", 
    149 to 164=> "00000000000000100", 165 to 177=> "00000000000000101", 
    178 to 188=> "00000000000000110", 189 to 197=> "00000000000000111", 
    198 to 205=> "00000000000001000", 206 to 212=> "00000000000001001", 
    213 to 218=> "00000000000001010", 219 to 224=> "00000000000001011", 
    225 to 230=> "00000000000001100", 231 to 234=> "00000000000001101", 
    235 to 239=> "00000000000001110", 240 to 243=> "00000000000001111", 
    244 to 247=> "00000000000010000", 248 to 251=> "00000000000010001", 
    252 to 255=> "00000000000010010", 256 to 258=> "00000000000010011", 
    259 to 261=> "00000000000010100", 262 to 264=> "00000000000010101", 
    265 to 267=> "00000000000010110", 268 to 270=> "00000000000010111", 
    271 to 273=> "00000000000011000", 274 to 275=> "00000000000011001", 
    276 to 278=> "00000000000011010", 279 to 280=> "00000000000011011", 
    281 to 282=> "00000000000011100", 283 to 284=> "00000000000011101", 
    285 to 287=> "00000000000011110", 288 to 289=> "00000000000011111", 
    290 to 291=> "00000000000100000", 292 to 293=> "00000000000100001", 
    294 to 295=> "00000000000100010", 296 => "00000000000100011", 
    297 to 298=> "00000000000100100", 299 to 300=> "00000000000100101", 
    301 to 302=> "00000000000100110", 303 => "00000000000100111", 
    304 to 305=> "00000000000101000", 306 => "00000000000101001", 
    307 to 308=> "00000000000101010", 309 => "00000000000101011", 
    310 to 311=> "00000000000101100", 312 => "00000000000101101", 
    313 to 314=> "00000000000101110", 315 => "00000000000101111", 
    316 => "00000000000110000", 317 to 318=> "00000000000110001", 
    319 => "00000000000110010", 320 => "00000000000110011", 
    321 => "00000000000110100", 322 to 323=> "00000000000110101", 
    324 => "00000000000110110", 325 => "00000000000110111", 
    326 => "00000000000111000", 327 => "00000000000111001", 
    328 => "00000000000111010", 329 => "00000000000111011", 
    330 => "00000000000111100", 331 to 332=> "00000000000111101", 
    333 => "00000000000111110", 334 => "00000000000111111", 
    335 => "00000000001000000", 336 => "00000000001000001", 
    337 => "00000000001000010", 338 => "00000000001000100", 
    339 => "00000000001000101", 340 => "00000000001000110", 
    341 => "00000000001000111", 342 => "00000000001001000", 
    343 => "00000000001001001", 344 => "00000000001001010", 
    345 => "00000000001001011", 346 => "00000000001001101", 
    347 => "00000000001001110", 348 => "00000000001001111", 
    349 => "00000000001010000", 350 => "00000000001010001", 
    351 => "00000000001010011", 352 => "00000000001010100", 
    353 => "00000000001010101", 354 => "00000000001010111", 
    355 => "00000000001011000", 356 => "00000000001011001", 
    357 => "00000000001011011", 358 => "00000000001011100", 
    359 => "00000000001011110", 360 => "00000000001011111", 
    361 => "00000000001100001", 362 => "00000000001100010", 
    363 => "00000000001100100", 364 => "00000000001100101", 
    365 => "00000000001100111", 366 => "00000000001101001", 
    367 => "00000000001101010", 368 => "00000000001101100", 
    369 => "00000000001101110", 370 => "00000000001101111", 
    371 => "00000000001110001", 372 => "00000000001110011", 
    373 => "00000000001110101", 374 => "00000000001110111", 
    375 => "00000000001111000", 376 => "00000000001111010", 
    377 => "00000000001111100", 378 => "00000000001111110", 
    379 => "00000000010000000", 380 => "00000000010000010", 
    381 => "00000000010000100", 382 => "00000000010000110", 
    383 => "00000000010001000", 384 => "00000000010001011", 
    385 => "00000000010001101", 386 => "00000000010001111", 
    387 => "00000000010010001", 388 => "00000000010010100", 
    389 => "00000000010010110", 390 => "00000000010011000", 
    391 => "00000000010011011", 392 => "00000000010011101", 
    393 => "00000000010100000", 394 => "00000000010100010", 
    395 => "00000000010100101", 396 => "00000000010100111", 
    397 => "00000000010101010", 398 => "00000000010101100", 
    399 => "00000000010101111", 400 => "00000000010110010", 
    401 => "00000000010110101", 402 => "00000000010111000", 
    403 => "00000000010111010", 404 => "00000000010111101", 
    405 => "00000000011000000", 406 => "00000000011000011", 
    407 => "00000000011000111", 408 => "00000000011001010", 
    409 => "00000000011001101", 410 => "00000000011010000", 
    411 => "00000000011010011", 412 => "00000000011010111", 
    413 => "00000000011011010", 414 => "00000000011011101", 
    415 => "00000000011100001", 416 => "00000000011100100", 
    417 => "00000000011101000", 418 => "00000000011101100", 
    419 => "00000000011101111", 420 => "00000000011110011", 
    421 => "00000000011110111", 422 => "00000000011111011", 
    423 => "00000000011111111", 424 => "00000000100000011", 
    425 => "00000000100000111", 426 => "00000000100001011", 
    427 => "00000000100001111", 428 => "00000000100010100", 
    429 => "00000000100011000", 430 => "00000000100011100", 
    431 => "00000000100100001", 432 => "00000000100100101", 
    433 => "00000000100101010", 434 => "00000000100101111", 
    435 => "00000000100110011", 436 => "00000000100111000", 
    437 => "00000000100111101", 438 => "00000000101000010", 
    439 => "00000000101000111", 440 => "00000000101001100", 
    441 => "00000000101010010", 442 => "00000000101010111", 
    443 => "00000000101011100", 444 => "00000000101100010", 
    445 => "00000000101100111", 446 => "00000000101101101", 
    447 => "00000000101110011", 448 => "00000000101111001", 
    449 => "00000000101111111", 450 => "00000000110000101", 
    451 => "00000000110001011", 452 => "00000000110010001", 
    453 => "00000000110010111", 454 => "00000000110011110", 
    455 => "00000000110100100", 456 => "00000000110101011", 
    457 => "00000000110110010", 458 => "00000000110111000", 
    459 => "00000000110111111", 460 => "00000000111000110", 
    461 => "00000000111001110", 462 => "00000000111010101", 
    463 => "00000000111011100", 464 => "00000000111100100", 
    465 => "00000000111101011", 466 => "00000000111110011", 
    467 => "00000000111111011", 468 => "00000001000000011", 
    469 => "00000001000001011", 470 => "00000001000010011", 
    471 => "00000001000011100", 472 => "00000001000100100", 
    473 => "00000001000101101", 474 => "00000001000110110", 
    475 => "00000001000111110", 476 => "00000001001000111", 
    477 => "00000001001010001", 478 => "00000001001011010", 
    479 => "00000001001100011", 480 => "00000001001101101", 
    481 => "00000001001110111", 482 => "00000001010000001", 
    483 => "00000001010001011", 484 => "00000001010010101", 
    485 => "00000001010100000", 486 => "00000001010101010", 
    487 => "00000001010110101", 488 => "00000001011000000", 
    489 => "00000001011001011", 490 => "00000001011010110", 
    491 => "00000001011100010", 492 => "00000001011101101", 
    493 => "00000001011111001", 494 => "00000001100000101", 
    495 => "00000001100010001", 496 => "00000001100011101", 
    497 => "00000001100101010", 498 => "00000001100110111", 
    499 => "00000001101000100", 500 => "00000001101010001", 
    501 => "00000001101011110", 502 => "00000001101101100", 
    503 => "00000001101111010", 504 => "00000001110001000", 
    505 => "00000001110010110", 506 => "00000001110100100", 
    507 => "00000001110110011", 508 => "00000001111000010", 
    509 => "00000001111010001", 510 => "00000001111100000", 
    511 => "00000001111110000", 512 => "00000010000000000", 
    513 => "00000010000010000", 514 => "00000010000100001", 
    515 => "00000010000110001", 516 => "00000010001000010", 
    517 => "00000010001010011", 518 => "00000010001100101", 
    519 => "00000010001110110", 520 => "00000010010001000", 
    521 => "00000010010011011", 522 => "00000010010101101", 
    523 => "00000010011000000", 524 => "00000010011010011", 
    525 => "00000010011100111", 526 => "00000010011111010", 
    527 => "00000010100001110", 528 => "00000010100100011", 
    529 => "00000010100111000", 530 => "00000010101001101", 
    531 => "00000010101100010", 532 => "00000010101111000", 
    533 => "00000010110001110", 534 => "00000010110100100", 
    535 => "00000010110111011", 536 => "00000010111010010", 
    537 => "00000010111101001", 538 => "00000011000000001", 
    539 => "00000011000011001", 540 => "00000011000110010", 
    541 => "00000011001001011", 542 => "00000011001100100", 
    543 => "00000011001111110", 544 => "00000011010011000", 
    545 => "00000011010110011", 546 => "00000011011001110", 
    547 => "00000011011101001", 548 => "00000011100000101", 
    549 => "00000011100100001", 550 => "00000011100111110", 
    551 => "00000011101011011", 552 => "00000011101111001", 
    553 => "00000011110010111", 554 => "00000011110110110", 
    555 => "00000011111010101", 556 => "00000011111110100", 
    557 => "00000100000010101", 558 => "00000100000110101", 
    559 => "00000100001010110", 560 => "00000100001111000", 
    561 => "00000100010011010", 562 => "00000100010111101", 
    563 => "00000100011100000", 564 => "00000100100000100", 
    565 => "00000100100101000", 566 => "00000100101001101", 
    567 => "00000100101110010", 568 => "00000100110011000", 
    569 => "00000100110111111", 570 => "00000100111100110", 
    571 => "00000101000001110", 572 => "00000101000110111", 
    573 => "00000101001100000", 574 => "00000101010001010", 
    575 => "00000101010110100", 576 => "00000101011100000", 
    577 => "00000101100001011", 578 => "00000101100111000", 
    579 => "00000101101100101", 580 => "00000101110010011", 
    581 => "00000101111000010", 582 => "00000101111110001", 
    583 => "00000110000100001", 584 => "00000110001010010", 
    585 => "00000110010000100", 586 => "00000110010110110", 
    587 => "00000110011101010", 588 => "00000110100011110", 
    589 => "00000110101010010", 590 => "00000110110001000", 
    591 => "00000110110111111", 592 => "00000110111110110", 
    593 => "00000111000101110", 594 => "00000111001101000", 
    595 => "00000111010100010", 596 => "00000111011011101", 
    597 => "00000111100011001", 598 => "00000111101010101", 
    599 => "00000111110010011", 600 => "00000111111010010", 
    601 => "00001000000010010", 602 => "00001000001010011", 
    603 => "00001000010010100", 604 => "00001000011010111", 
    605 => "00001000100011011", 606 => "00001000101100000", 
    607 => "00001000110100110", 608 => "00001000111101101", 
    609 => "00001001000110110", 610 => "00001001001111111", 
    611 => "00001001011001001", 612 => "00001001100010101", 
    613 => "00001001101100010", 614 => "00001001110110000", 
    615 => "00001010000000000", 616 => "00001010001010000", 
    617 => "00001010010100010", 618 => "00001010011110101", 
    619 => "00001010101001010", 620 => "00001010110100000", 
    621 => "00001010111110111", 622 => "00001011001001111", 
    623 => "00001011010101001", 624 => "00001011100000101", 
    625 => "00001011101100010", 626 => "00001011111000000", 
    627 => "00001100000100000", 628 => "00001100010000001", 
    629 => "00001100011100100", 630 => "00001100101001000", 
    631 => "00001100110101110", 632 => "00001101000010101", 
    633 => "00001101001111110", 634 => "00001101011101001", 
    635 => "00001101101010110", 636 => "00001101111000100", 
    637 => "00001110000110100", 638 => "00001110010100110", 
    639 => "00001110100011001", 640 => "00001110110001110", 
    641 => "00001111000000110", 642 => "00001111001111111", 
    643 => "00001111011111010", 644 => "00001111101110110", 
    645 => "00001111111110101", 646 => "00010000001110110", 
    647 => "00010000011111001", 648 => "00010000101111110", 
    649 => "00010001000000101", 650 => "00010001010001110", 
    651 => "00010001100011001", 652 => "00010001110100111", 
    653 => "00010010000110111", 654 => "00010010011001001", 
    655 => "00010010101011101", 656 => "00010010111110011", 
    657 => "00010011010001100", 658 => "00010011100101000", 
    659 => "00010011111000110", 660 => "00010100001100110", 
    661 => "00010100100001001", 662 => "00010100110101110", 
    663 => "00010101001010110", 664 => "00010101100000001", 
    665 => "00010101110101110", 666 => "00010110001011111", 
    667 => "00010110100010001", 668 => "00010110111000111", 
    669 => "00010111010000000", 670 => "00010111100111011", 
    671 => "00010111111111001", 672 => "00011000010111011", 
    673 => "00011000101111111", 674 => "00011001001000111", 
    675 => "00011001100010010", 676 => "00011001111011111", 
    677 => "00011010010110001", 678 => "00011010110000101", 
    679 => "00011011001011101", 680 => "00011011100111000", 
    681 => "00011100000010110", 682 => "00011100011111001", 
    683 => "00011100111011110", 684 => "00011101011001000", 
    685 => "00011101110110101", 686 => "00011110010100101", 
    687 => "00011110110011010", 688 => "00011111010010010", 
    689 => "00011111110001110", 690 => "00100000010001111", 
    691 => "00100000110010011", 692 => "00100001010011011", 
    693 => "00100001110101000", 694 => "00100010010111000", 
    695 => "00100010111001101", 696 => "00100011011100111", 
    697 => "00100100000000101", 698 => "00100100100100111", 
    699 => "00100101001001110", 700 => "00100101101111001", 
    701 => "00100110010101010", 702 => "00100110111011111", 
    703 => "00100111100011001", 704 => "00101000001011000", 
    705 => "00101000110011011", 706 => "00101001011100100", 
    707 => "00101010000110011", 708 => "00101010110000110", 
    709 => "00101011011011111", 710 => "00101100000111101", 
    711 => "00101100110100001", 712 => "00101101100001010", 
    713 => "00101110001111001", 714 => "00101110111101110", 
    715 => "00101111101101001", 716 => "00110000011101001", 
    717 => "00110001001110000", 718 => "00110001111111101", 
    719 => "00110010110010000", 720 => "00110011100101001", 
    721 => "00110100011001001", 722 => "00110101001110000", 
    723 => "00110110000011101", 724 => "00110110111010001", 
    725 => "00110111110001011", 726 => "00111000101001101", 
    727 => "00111001100010110", 728 => "00111010011100110", 
    729 => "00111011010111101", 730 => "00111100010011100", 
    731 => "00111101010000010", 732 => "00111110001110000", 
    733 => "00111111001100101", 734 => "01000000001100011", 
    735 => "01000001001101000", 736 => "01000010001110110", 
    737 => "01000011010001100", 738 => "01000100010101011", 
    739 => "01000101011010010", 740 => "01000110100000001", 
    741 => "01000111100111010", 742 => "01001000101111011", 
    743 => "01001001111000110", 744 => "01001011000011001", 
    745 => "01001100001110110", 746 => "01001101011011101", 
    747 => "01001110101001101", 748 => "01001111111001000", 
    749 => "01010001001001100", 750 => "01010010011011010", 
    751 => "01010011101110011", 752 => "01010101000010110", 
    753 => "01010110011000011", 754 => "01010111101111100", 
    755 => "01011001000111111", 756 => "01011010100001110", 
    757 => "01011011111101000", 758 => "01011101011001101", 
    759 => "01011110110111110", 760 => "01100000010111011", 
    761 => "01100001111000100", 762 => "01100011011011001", 
    763 => "01100100111111011", 764 => "01100110100101001", 
    765 => "01101000001100100", 766 => "01101001110101100", 
    767 => "01101011100000010", 768 => "01101101001100101", 
    769 => "01101110111010101", 770 => "01110000101010011", 
    771 => "01110010011100000", 772 => "01110100001111010", 
    773 => "01110110000100100", 774 => "01110111111011011", 
    775 => "01111001110100010", 776 => "01111011101111001", 
    777 => "01111101101011110", 778 => "01111111101010100", 
    779 => "10000001101011001", 780 => "10000011101101111", 
    781 => "10000101110010101", 782 => "10000111111001011", 
    783 => "10001010000010011", 784 => "10001100001101100", 
    785 => "10001110011010110", 786 => "10010000101010011", 
    787 => "10010010111100001", 788 => "10010101010000010", 
    789 => "10010111100110101", 790 => "10011001111111100", 
    791 => "10011100011010101", 792 => "10011110111000010", 
    793 => "10100001011000011", 794 => "10100011111011001", 
    795 => "10100110100000010", 796 => "10101001001000001", 
    797 => "10101011110010100", 798 => "10101110011111110", 
    799 => "10110001001111100", 800 => "10110100000010010", 
    801 => "10110110110111101", 802 => "10111001110000000", 
    803 => "10111100101011001", 804 => "10111111101001010", 
    805 => "11000010101010100", 806 => "11000101101110101", 
    807 => "11001000110101111", 808 => "11001100000000011", 
    809 => "11001111001110000", 810 => "11010010011110110", 
    811 => "11010101110011000", 812 => "11011001001010011", 
    813 => "11011100100101010", 814 => "11100000000011101", 
    815 => "11100011100101011", 816 => "11100111001010110", 
    817 => "11101010110011110", 818 => "11101110100000011", 
    819 => "11110010010000110", 820 => "11110110000101000", 
    821 => "11111001111101000", 822 => "11111101111000111", 
    823 to 1023=> "11111111111111111" );
signal mem1 : mem_array := (
    0 to 24=> "00000000000000000", 25 to 94=> "00000000000000001", 
    95 to 127=> "00000000000000010", 128 to 148=> "00000000000000011", 
    149 to 164=> "00000000000000100", 165 to 177=> "00000000000000101", 
    178 to 188=> "00000000000000110", 189 to 197=> "00000000000000111", 
    198 to 205=> "00000000000001000", 206 to 212=> "00000000000001001", 
    213 to 218=> "00000000000001010", 219 to 224=> "00000000000001011", 
    225 to 230=> "00000000000001100", 231 to 234=> "00000000000001101", 
    235 to 239=> "00000000000001110", 240 to 243=> "00000000000001111", 
    244 to 247=> "00000000000010000", 248 to 251=> "00000000000010001", 
    252 to 255=> "00000000000010010", 256 to 258=> "00000000000010011", 
    259 to 261=> "00000000000010100", 262 to 264=> "00000000000010101", 
    265 to 267=> "00000000000010110", 268 to 270=> "00000000000010111", 
    271 to 273=> "00000000000011000", 274 to 275=> "00000000000011001", 
    276 to 278=> "00000000000011010", 279 to 280=> "00000000000011011", 
    281 to 282=> "00000000000011100", 283 to 284=> "00000000000011101", 
    285 to 287=> "00000000000011110", 288 to 289=> "00000000000011111", 
    290 to 291=> "00000000000100000", 292 to 293=> "00000000000100001", 
    294 to 295=> "00000000000100010", 296 => "00000000000100011", 
    297 to 298=> "00000000000100100", 299 to 300=> "00000000000100101", 
    301 to 302=> "00000000000100110", 303 => "00000000000100111", 
    304 to 305=> "00000000000101000", 306 => "00000000000101001", 
    307 to 308=> "00000000000101010", 309 => "00000000000101011", 
    310 to 311=> "00000000000101100", 312 => "00000000000101101", 
    313 to 314=> "00000000000101110", 315 => "00000000000101111", 
    316 => "00000000000110000", 317 to 318=> "00000000000110001", 
    319 => "00000000000110010", 320 => "00000000000110011", 
    321 => "00000000000110100", 322 to 323=> "00000000000110101", 
    324 => "00000000000110110", 325 => "00000000000110111", 
    326 => "00000000000111000", 327 => "00000000000111001", 
    328 => "00000000000111010", 329 => "00000000000111011", 
    330 => "00000000000111100", 331 to 332=> "00000000000111101", 
    333 => "00000000000111110", 334 => "00000000000111111", 
    335 => "00000000001000000", 336 => "00000000001000001", 
    337 => "00000000001000010", 338 => "00000000001000100", 
    339 => "00000000001000101", 340 => "00000000001000110", 
    341 => "00000000001000111", 342 => "00000000001001000", 
    343 => "00000000001001001", 344 => "00000000001001010", 
    345 => "00000000001001011", 346 => "00000000001001101", 
    347 => "00000000001001110", 348 => "00000000001001111", 
    349 => "00000000001010000", 350 => "00000000001010001", 
    351 => "00000000001010011", 352 => "00000000001010100", 
    353 => "00000000001010101", 354 => "00000000001010111", 
    355 => "00000000001011000", 356 => "00000000001011001", 
    357 => "00000000001011011", 358 => "00000000001011100", 
    359 => "00000000001011110", 360 => "00000000001011111", 
    361 => "00000000001100001", 362 => "00000000001100010", 
    363 => "00000000001100100", 364 => "00000000001100101", 
    365 => "00000000001100111", 366 => "00000000001101001", 
    367 => "00000000001101010", 368 => "00000000001101100", 
    369 => "00000000001101110", 370 => "00000000001101111", 
    371 => "00000000001110001", 372 => "00000000001110011", 
    373 => "00000000001110101", 374 => "00000000001110111", 
    375 => "00000000001111000", 376 => "00000000001111010", 
    377 => "00000000001111100", 378 => "00000000001111110", 
    379 => "00000000010000000", 380 => "00000000010000010", 
    381 => "00000000010000100", 382 => "00000000010000110", 
    383 => "00000000010001000", 384 => "00000000010001011", 
    385 => "00000000010001101", 386 => "00000000010001111", 
    387 => "00000000010010001", 388 => "00000000010010100", 
    389 => "00000000010010110", 390 => "00000000010011000", 
    391 => "00000000010011011", 392 => "00000000010011101", 
    393 => "00000000010100000", 394 => "00000000010100010", 
    395 => "00000000010100101", 396 => "00000000010100111", 
    397 => "00000000010101010", 398 => "00000000010101100", 
    399 => "00000000010101111", 400 => "00000000010110010", 
    401 => "00000000010110101", 402 => "00000000010111000", 
    403 => "00000000010111010", 404 => "00000000010111101", 
    405 => "00000000011000000", 406 => "00000000011000011", 
    407 => "00000000011000111", 408 => "00000000011001010", 
    409 => "00000000011001101", 410 => "00000000011010000", 
    411 => "00000000011010011", 412 => "00000000011010111", 
    413 => "00000000011011010", 414 => "00000000011011101", 
    415 => "00000000011100001", 416 => "00000000011100100", 
    417 => "00000000011101000", 418 => "00000000011101100", 
    419 => "00000000011101111", 420 => "00000000011110011", 
    421 => "00000000011110111", 422 => "00000000011111011", 
    423 => "00000000011111111", 424 => "00000000100000011", 
    425 => "00000000100000111", 426 => "00000000100001011", 
    427 => "00000000100001111", 428 => "00000000100010100", 
    429 => "00000000100011000", 430 => "00000000100011100", 
    431 => "00000000100100001", 432 => "00000000100100101", 
    433 => "00000000100101010", 434 => "00000000100101111", 
    435 => "00000000100110011", 436 => "00000000100111000", 
    437 => "00000000100111101", 438 => "00000000101000010", 
    439 => "00000000101000111", 440 => "00000000101001100", 
    441 => "00000000101010010", 442 => "00000000101010111", 
    443 => "00000000101011100", 444 => "00000000101100010", 
    445 => "00000000101100111", 446 => "00000000101101101", 
    447 => "00000000101110011", 448 => "00000000101111001", 
    449 => "00000000101111111", 450 => "00000000110000101", 
    451 => "00000000110001011", 452 => "00000000110010001", 
    453 => "00000000110010111", 454 => "00000000110011110", 
    455 => "00000000110100100", 456 => "00000000110101011", 
    457 => "00000000110110010", 458 => "00000000110111000", 
    459 => "00000000110111111", 460 => "00000000111000110", 
    461 => "00000000111001110", 462 => "00000000111010101", 
    463 => "00000000111011100", 464 => "00000000111100100", 
    465 => "00000000111101011", 466 => "00000000111110011", 
    467 => "00000000111111011", 468 => "00000001000000011", 
    469 => "00000001000001011", 470 => "00000001000010011", 
    471 => "00000001000011100", 472 => "00000001000100100", 
    473 => "00000001000101101", 474 => "00000001000110110", 
    475 => "00000001000111110", 476 => "00000001001000111", 
    477 => "00000001001010001", 478 => "00000001001011010", 
    479 => "00000001001100011", 480 => "00000001001101101", 
    481 => "00000001001110111", 482 => "00000001010000001", 
    483 => "00000001010001011", 484 => "00000001010010101", 
    485 => "00000001010100000", 486 => "00000001010101010", 
    487 => "00000001010110101", 488 => "00000001011000000", 
    489 => "00000001011001011", 490 => "00000001011010110", 
    491 => "00000001011100010", 492 => "00000001011101101", 
    493 => "00000001011111001", 494 => "00000001100000101", 
    495 => "00000001100010001", 496 => "00000001100011101", 
    497 => "00000001100101010", 498 => "00000001100110111", 
    499 => "00000001101000100", 500 => "00000001101010001", 
    501 => "00000001101011110", 502 => "00000001101101100", 
    503 => "00000001101111010", 504 => "00000001110001000", 
    505 => "00000001110010110", 506 => "00000001110100100", 
    507 => "00000001110110011", 508 => "00000001111000010", 
    509 => "00000001111010001", 510 => "00000001111100000", 
    511 => "00000001111110000", 512 => "00000010000000000", 
    513 => "00000010000010000", 514 => "00000010000100001", 
    515 => "00000010000110001", 516 => "00000010001000010", 
    517 => "00000010001010011", 518 => "00000010001100101", 
    519 => "00000010001110110", 520 => "00000010010001000", 
    521 => "00000010010011011", 522 => "00000010010101101", 
    523 => "00000010011000000", 524 => "00000010011010011", 
    525 => "00000010011100111", 526 => "00000010011111010", 
    527 => "00000010100001110", 528 => "00000010100100011", 
    529 => "00000010100111000", 530 => "00000010101001101", 
    531 => "00000010101100010", 532 => "00000010101111000", 
    533 => "00000010110001110", 534 => "00000010110100100", 
    535 => "00000010110111011", 536 => "00000010111010010", 
    537 => "00000010111101001", 538 => "00000011000000001", 
    539 => "00000011000011001", 540 => "00000011000110010", 
    541 => "00000011001001011", 542 => "00000011001100100", 
    543 => "00000011001111110", 544 => "00000011010011000", 
    545 => "00000011010110011", 546 => "00000011011001110", 
    547 => "00000011011101001", 548 => "00000011100000101", 
    549 => "00000011100100001", 550 => "00000011100111110", 
    551 => "00000011101011011", 552 => "00000011101111001", 
    553 => "00000011110010111", 554 => "00000011110110110", 
    555 => "00000011111010101", 556 => "00000011111110100", 
    557 => "00000100000010101", 558 => "00000100000110101", 
    559 => "00000100001010110", 560 => "00000100001111000", 
    561 => "00000100010011010", 562 => "00000100010111101", 
    563 => "00000100011100000", 564 => "00000100100000100", 
    565 => "00000100100101000", 566 => "00000100101001101", 
    567 => "00000100101110010", 568 => "00000100110011000", 
    569 => "00000100110111111", 570 => "00000100111100110", 
    571 => "00000101000001110", 572 => "00000101000110111", 
    573 => "00000101001100000", 574 => "00000101010001010", 
    575 => "00000101010110100", 576 => "00000101011100000", 
    577 => "00000101100001011", 578 => "00000101100111000", 
    579 => "00000101101100101", 580 => "00000101110010011", 
    581 => "00000101111000010", 582 => "00000101111110001", 
    583 => "00000110000100001", 584 => "00000110001010010", 
    585 => "00000110010000100", 586 => "00000110010110110", 
    587 => "00000110011101010", 588 => "00000110100011110", 
    589 => "00000110101010010", 590 => "00000110110001000", 
    591 => "00000110110111111", 592 => "00000110111110110", 
    593 => "00000111000101110", 594 => "00000111001101000", 
    595 => "00000111010100010", 596 => "00000111011011101", 
    597 => "00000111100011001", 598 => "00000111101010101", 
    599 => "00000111110010011", 600 => "00000111111010010", 
    601 => "00001000000010010", 602 => "00001000001010011", 
    603 => "00001000010010100", 604 => "00001000011010111", 
    605 => "00001000100011011", 606 => "00001000101100000", 
    607 => "00001000110100110", 608 => "00001000111101101", 
    609 => "00001001000110110", 610 => "00001001001111111", 
    611 => "00001001011001001", 612 => "00001001100010101", 
    613 => "00001001101100010", 614 => "00001001110110000", 
    615 => "00001010000000000", 616 => "00001010001010000", 
    617 => "00001010010100010", 618 => "00001010011110101", 
    619 => "00001010101001010", 620 => "00001010110100000", 
    621 => "00001010111110111", 622 => "00001011001001111", 
    623 => "00001011010101001", 624 => "00001011100000101", 
    625 => "00001011101100010", 626 => "00001011111000000", 
    627 => "00001100000100000", 628 => "00001100010000001", 
    629 => "00001100011100100", 630 => "00001100101001000", 
    631 => "00001100110101110", 632 => "00001101000010101", 
    633 => "00001101001111110", 634 => "00001101011101001", 
    635 => "00001101101010110", 636 => "00001101111000100", 
    637 => "00001110000110100", 638 => "00001110010100110", 
    639 => "00001110100011001", 640 => "00001110110001110", 
    641 => "00001111000000110", 642 => "00001111001111111", 
    643 => "00001111011111010", 644 => "00001111101110110", 
    645 => "00001111111110101", 646 => "00010000001110110", 
    647 => "00010000011111001", 648 => "00010000101111110", 
    649 => "00010001000000101", 650 => "00010001010001110", 
    651 => "00010001100011001", 652 => "00010001110100111", 
    653 => "00010010000110111", 654 => "00010010011001001", 
    655 => "00010010101011101", 656 => "00010010111110011", 
    657 => "00010011010001100", 658 => "00010011100101000", 
    659 => "00010011111000110", 660 => "00010100001100110", 
    661 => "00010100100001001", 662 => "00010100110101110", 
    663 => "00010101001010110", 664 => "00010101100000001", 
    665 => "00010101110101110", 666 => "00010110001011111", 
    667 => "00010110100010001", 668 => "00010110111000111", 
    669 => "00010111010000000", 670 => "00010111100111011", 
    671 => "00010111111111001", 672 => "00011000010111011", 
    673 => "00011000101111111", 674 => "00011001001000111", 
    675 => "00011001100010010", 676 => "00011001111011111", 
    677 => "00011010010110001", 678 => "00011010110000101", 
    679 => "00011011001011101", 680 => "00011011100111000", 
    681 => "00011100000010110", 682 => "00011100011111001", 
    683 => "00011100111011110", 684 => "00011101011001000", 
    685 => "00011101110110101", 686 => "00011110010100101", 
    687 => "00011110110011010", 688 => "00011111010010010", 
    689 => "00011111110001110", 690 => "00100000010001111", 
    691 => "00100000110010011", 692 => "00100001010011011", 
    693 => "00100001110101000", 694 => "00100010010111000", 
    695 => "00100010111001101", 696 => "00100011011100111", 
    697 => "00100100000000101", 698 => "00100100100100111", 
    699 => "00100101001001110", 700 => "00100101101111001", 
    701 => "00100110010101010", 702 => "00100110111011111", 
    703 => "00100111100011001", 704 => "00101000001011000", 
    705 => "00101000110011011", 706 => "00101001011100100", 
    707 => "00101010000110011", 708 => "00101010110000110", 
    709 => "00101011011011111", 710 => "00101100000111101", 
    711 => "00101100110100001", 712 => "00101101100001010", 
    713 => "00101110001111001", 714 => "00101110111101110", 
    715 => "00101111101101001", 716 => "00110000011101001", 
    717 => "00110001001110000", 718 => "00110001111111101", 
    719 => "00110010110010000", 720 => "00110011100101001", 
    721 => "00110100011001001", 722 => "00110101001110000", 
    723 => "00110110000011101", 724 => "00110110111010001", 
    725 => "00110111110001011", 726 => "00111000101001101", 
    727 => "00111001100010110", 728 => "00111010011100110", 
    729 => "00111011010111101", 730 => "00111100010011100", 
    731 => "00111101010000010", 732 => "00111110001110000", 
    733 => "00111111001100101", 734 => "01000000001100011", 
    735 => "01000001001101000", 736 => "01000010001110110", 
    737 => "01000011010001100", 738 => "01000100010101011", 
    739 => "01000101011010010", 740 => "01000110100000001", 
    741 => "01000111100111010", 742 => "01001000101111011", 
    743 => "01001001111000110", 744 => "01001011000011001", 
    745 => "01001100001110110", 746 => "01001101011011101", 
    747 => "01001110101001101", 748 => "01001111111001000", 
    749 => "01010001001001100", 750 => "01010010011011010", 
    751 => "01010011101110011", 752 => "01010101000010110", 
    753 => "01010110011000011", 754 => "01010111101111100", 
    755 => "01011001000111111", 756 => "01011010100001110", 
    757 => "01011011111101000", 758 => "01011101011001101", 
    759 => "01011110110111110", 760 => "01100000010111011", 
    761 => "01100001111000100", 762 => "01100011011011001", 
    763 => "01100100111111011", 764 => "01100110100101001", 
    765 => "01101000001100100", 766 => "01101001110101100", 
    767 => "01101011100000010", 768 => "01101101001100101", 
    769 => "01101110111010101", 770 => "01110000101010011", 
    771 => "01110010011100000", 772 => "01110100001111010", 
    773 => "01110110000100100", 774 => "01110111111011011", 
    775 => "01111001110100010", 776 => "01111011101111001", 
    777 => "01111101101011110", 778 => "01111111101010100", 
    779 => "10000001101011001", 780 => "10000011101101111", 
    781 => "10000101110010101", 782 => "10000111111001011", 
    783 => "10001010000010011", 784 => "10001100001101100", 
    785 => "10001110011010110", 786 => "10010000101010011", 
    787 => "10010010111100001", 788 => "10010101010000010", 
    789 => "10010111100110101", 790 => "10011001111111100", 
    791 => "10011100011010101", 792 => "10011110111000010", 
    793 => "10100001011000011", 794 => "10100011111011001", 
    795 => "10100110100000010", 796 => "10101001001000001", 
    797 => "10101011110010100", 798 => "10101110011111110", 
    799 => "10110001001111100", 800 => "10110100000010010", 
    801 => "10110110110111101", 802 => "10111001110000000", 
    803 => "10111100101011001", 804 => "10111111101001010", 
    805 => "11000010101010100", 806 => "11000101101110101", 
    807 => "11001000110101111", 808 => "11001100000000011", 
    809 => "11001111001110000", 810 => "11010010011110110", 
    811 => "11010101110011000", 812 => "11011001001010011", 
    813 => "11011100100101010", 814 => "11100000000011101", 
    815 => "11100011100101011", 816 => "11100111001010110", 
    817 => "11101010110011110", 818 => "11101110100000011", 
    819 => "11110010010000110", 820 => "11110110000101000", 
    821 => "11111001111101000", 822 => "11111101111000111", 
    823 to 1023=> "11111111111111111" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

memory_access_guard_1: process (address1) 
begin
      address1_tmp <= address1;
--synthesis translate_off
      if (CONV_INTEGER(address1) > AddressRange-1) then
           address1_tmp <= (others => '0');
      else 
           address1_tmp <= address1;
      end if;
--synthesis translate_on
end process;

memory_access_guard_2: process (address2) 
begin
      address2_tmp <= address2;
--synthesis translate_off
      if (CONV_INTEGER(address2) > AddressRange-1) then
           address2_tmp <= (others => '0');
      else 
           address2_tmp <= address2;
      end if;
--synthesis translate_on
end process;

memory_access_guard_3: process (address3) 
begin
      address3_tmp <= address3;
--synthesis translate_off
      if (CONV_INTEGER(address3) > AddressRange-1) then
           address3_tmp <= (others => '0');
      else 
           address3_tmp <= address3;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem0(CONV_INTEGER(address0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem0(CONV_INTEGER(address1_tmp)); 
        end if;
        if (ce2 = '1') then 
            q2 <= mem1(CONV_INTEGER(address2_tmp)); 
        end if;
        if (ce3 = '1') then 
            q3 <= mem1(CONV_INTEGER(address3_tmp)); 
        end if;
    end if;
end process;

end rtl;

