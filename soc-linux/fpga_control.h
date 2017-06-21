#ifndef __FPGA_CONTROL__
#define __FPGA_CONTROL__


#define MAIN_LINK_OFFSET 0x0

#define OUTPUT_SIZE 4

#include <stdint.h>
#include "hps_0.h"

struct fpga_control {
	void *mem;
	volatile uint32_t *main_link;
	int fd;
};

int init_fpga_control(struct fpga_control *fpga);
//void release_fpga_control(struct fpga_control *fpga);

/*void fpga_reset_unit(struct fpga_control *fpga, int unit);
void fpga_start_unit(struct fpga_control *fpga, int unit);
int fpga_unit_done(struct fpga_control *fpga, int unit);
void fpga_copy_input(struct fpga_control *fpga, uint32_t *input, int unit); */
void fpga_copy_output(struct fpga_control *fpga, uint32_t *output);

#endif
