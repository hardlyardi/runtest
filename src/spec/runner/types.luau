--[[MIT License Copyright (c) 2025 @hardlyardi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]
do
end

export type SpecTimer = {
	time_began: number?,
	time_initialized: number?,
	time_finished: number?,
}

export type CompletedTest = {
	result: "PASS" | "FAIL" | "ERROR",
	log: string,

	timer: SpecTimer,
}

export type CompletedSpec = CompletedTest & {
	tests: { [string]: CompletedTest },
	amount_pass: number,
	amount_fail: number,
	amount_error: number,
}

export type SpecRunner = {
	_spec_path: string,
	_spec_name: string,

	active_test: string?,
	is_initializing: boolean,
	test: (self: SpecRunner) -> CompletedSpec,
}

return nil
