package kha.flash.graphics;

import flash.display3D.IndexBuffer3D;
import flash.Vector;

class IndexBuffer implements kha.graphics.IndexBuffer {
	public var indexBuffer: IndexBuffer3D;
	private var indices: Vector<UInt>;
	private var lockedIndices: Array<Int>;
	public static var current: IndexBuffer;
	
	public function new(indexCount: Int) {
		indexBuffer = Graphics.context.createIndexBuffer(indexCount);
		indices = new Vector<UInt>(indexCount);
		lockedIndices = new Array<Int>();
		lockedIndices[indexCount - 1] = 0;
	}
	
	public function lock(): Array<Int> {
		return lockedIndices;
	}
	
	public function unlock(): Void {
		for (i in 0...indices.length) {
			indices[i] = lockedIndices[i];
		}
		indexBuffer.uploadFromVector(indices, 0, indices.length);
	}
	
	public function count(): Int {
		return indices.length;
	}
	
	public function set(): Void {
		current = this;
	}
}
