#
# Makefile for misc devices that really don't fit anywhere else.
#

obj-$(CONFIG_IBM_ASM)		+= ibmasm/
obj-$(CONFIG_HDPU_FEATURES)	+= hdpuftrs/
obj-$(CONFIG_ATMEL_PWM)		+= atmel_pwm.o
obj-$(CONFIG_ATMEL_SSC)		+= atmel-ssc.o
obj-$(CONFIG_ATMEL_TCLIB)	+= atmel_tclib.o
obj-$(CONFIG_ICS932S401)	+= ics932s401.o
obj-$(CONFIG_LKDTM)		+= lkdtm.o
obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
obj-$(CONFIG_PHANTOM)		+= phantom.o
obj-$(CONFIG_ANDROID_PMEM)	+= pmem.o
obj-$(CONFIG_ANDROID_PMEM_KAPI_TEST)	+= pmem_kernel_test.o
obj-$(CONFIG_SGI_IOC4)		+= ioc4.o
obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
obj-$(CONFIG_KERNEL_DEBUGGER_CORE)	+= kernel_debugger.o
obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
obj-$(CONFIG_SGI_XP)		+= sgi-xp/
obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
obj-$(CONFIG_HP_ILO)		+= hpilo.o
obj-$(CONFIG_ISL29003)		+= isl29003.o
obj-$(CONFIG_EP93XX_PWM)	+= ep93xx_pwm.o
obj-$(CONFIG_UID_STAT)		+= uid_stat.o
obj-$(CONFIG_IFACE_STAT)	+= iface_stat.o
obj-$(CONFIG_C2PORT)		+= c2port/
obj-y				+= eeprom/
obj-y				+= cb710/
obj-$(CONFIG_WL127X_RFKILL)	+= wl127x-rfkill.o
obj-$(CONFIG_APANIC)		+= apanic.o

obj-$(CONFIG_VIDC) += vidc/
obj-$(CONFIG_TSIF) += msm_tsif.o
msm_tsif-objs := tsif.o

obj-$(CONFIG_TSIF_CHRDEV) += tsif_chrdev.o
obj-$(CONFIG_ANDROID_VIBRATOR) += android_vibrator.o

obj-$(CONFIG_HAPTIC_ISA1200)		+= isa1200.o
obj-$(CONFIG_GENERIC_BLN) += bln.o
obj-$(CONFIG_PMIC8058_PWM) += pmic8058-pwm.o
obj-$(CONFIG_PMIC8058_VIBRATOR) += pmic8058-vibrator.o
obj-$(CONFIG_PMIC8058_NFC) += pmic8058-nfc.o

ifeq ($(CONFIG_FRANDOM), y)
obj-m += frandom.o
endif

obj-$(CONFIG_SWEEP2WAKE)        += sweep2wake.o
obj-$(CONFIG_FSYNC_CONTROL)     += fsync_control.o
obj-$(CONFIG_LGE_AT_CMD_DEVICE) += lge_ats_at_class.o
obj-$(CONFIG_LGE_AT_CMD_DEVICE) += lge_ats_at.o
