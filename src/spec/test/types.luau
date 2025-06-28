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
local luausignal = require("../../utils/luausignal")

type Signal<T...> = luausignal.Identity<T...>

export type TestDefinition = (interface: TestInterface) -> ()

export type TestInterface = setmetatable<{
	_output: string,
	_failed: boolean,
	_break: Signal<()>,
}, {
	__index: TestInterfaceMethods,
}>
type TestInterfaceMethods = {
	fail: (self: TestInterface, message: string?) -> (),
	expect_exactly_equal: <Left, Right>(self: TestInterface, left: Left, right: Right) -> (),
	expect_not_exactly_equal: <Left, Right>(self: TestInterface, left: Left, right: Right) -> (),
	expect_equal: <Left, Right>(
		self: TestInterface,
		left: Left,
		right: Right,
		epsilon: number?
	) -> (),
	expect_not_equal: <Left, Right>(
		self: TestInterface,
		left: Left,
		right: Right,
		epsilon: number?
	) -> (),
	expect_truthy: <Value>(self: TestInterface, value: Value) -> (),
	expect_falsy: <Value>(self: TestInterface, value: Value) -> (),
	early_end: (self: TestInterface) -> (),
	output: (self: TestInterface, message: string) -> (),
	output_no_newline: (self: TestInterface, message: string) -> (),
}

return nil
