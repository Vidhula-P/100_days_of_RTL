TOP = sequence_detector_tb
OUT = sequence_detector.vvp

SRCS = \
  ../day_12_sequence_detector/sequence_detector.sv \
  ../day_12_sequence_detector/sequence_detector_tb.sv

$(OUT): $(SRCS)
	iverilog -g2012 -o $(OUT) $(SRCS)

run: $(OUT)
	vvp $(OUT)

clean:
	rm -f $(OUT)
