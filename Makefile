# DAMPI Makefile

# Vars and Flags
BUILD_DIR = build
SRC_DIR = src
EXE_NAME = dampi
LDFLAGS = -ldflags="-s -w"
VERSION := $(shell git rev-list --count HEAD)

# Source Files
CORE = dampi.go
COMPILE_CORE = src/dampi.go

all: pre-build
	GOOS=linux go build -o $(BUILD_DIR)/$(EXE_NAME)_linux_v$(VERSION) $(LDFLAGS) $(COMPILE_CORE)
	GOOS=freebsd go build -o $(BUILD_DIR)/$(EXE_NAME)_freebsd_v$(VERSION) $(LDFLAGS) $(COMPILE_CORE)

pre-build:
	# Clean Before Stage
	rm -rf $(BUILD_DIR)
	rm -rf $(SRC_DIR)
	mkdir $(BUILD_DIR)
	mkdir $(SRC_DIR)

	# Inject Vars Before Compile
	sed "s/@VERSION@/$(VERSION)/g" $(CORE) > $(COMPILE_CORE)
