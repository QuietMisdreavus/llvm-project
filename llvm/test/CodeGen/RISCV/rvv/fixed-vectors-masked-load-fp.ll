; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -mattr=+m,+v,+f,+d,+zvfh -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV32
; RUN: llc -mtriple=riscv64 -mattr=+m,+v,+f,+d,+zvfh -verify-machineinstrs < %s | FileCheck %s --check-prefixes=CHECK,RV64

define void @masked_load_v1f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v1f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e16, mf4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <1 x half>, ptr %m_ptr
  %mask = fcmp oeq <1 x half> %m, zeroinitializer
  %load = call <1 x half> @llvm.masked.load.v1f16(ptr %a, i32 8, <1 x i1> %mask, <1 x half> undef)
  store <1 x half> %load, ptr %res_ptr
  ret void
}
declare <1 x half> @llvm.masked.load.v1f16(ptr, i32, <1 x i1>, <1 x half>)

define void @masked_load_v1f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v1f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 1, e32, mf2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <1 x float>, ptr %m_ptr
  %mask = fcmp oeq <1 x float> %m, zeroinitializer
  %load = call <1 x float> @llvm.masked.load.v1f32(ptr %a, i32 8, <1 x i1> %mask, <1 x float> undef)
  store <1 x float> %load, ptr %res_ptr
  ret void
}
declare <1 x float> @llvm.masked.load.v1f32(ptr, i32, <1 x i1>, <1 x float>)

define void @masked_load_v1f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v1f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 1, e64, m1, ta, ma
; RV32-NEXT:    vle64.v v8, (a1)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v0, v8, fa5
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v1f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 1, e64, m1, ta, ma
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v0, v8, fa5
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    ret
  %m = load <1 x double>, ptr %m_ptr
  %mask = fcmp oeq <1 x double> %m, zeroinitializer
  %load = call <1 x double> @llvm.masked.load.v1f64(ptr %a, i32 8, <1 x i1> %mask, <1 x double> undef)
  store <1 x double> %load, ptr %res_ptr
  ret void
}
declare <1 x double> @llvm.masked.load.v1f64(ptr, i32, <1 x i1>, <1 x double>)

define void @masked_load_v2f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v2f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e16, mf4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <2 x half>, ptr %m_ptr
  %mask = fcmp oeq <2 x half> %m, zeroinitializer
  %load = call <2 x half> @llvm.masked.load.v2f16(ptr %a, i32 8, <2 x i1> %mask, <2 x half> undef)
  store <2 x half> %load, ptr %res_ptr
  ret void
}
declare <2 x half> @llvm.masked.load.v2f16(ptr, i32, <2 x i1>, <2 x half>)

define void @masked_load_v2f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v2f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 2, e32, mf2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <2 x float>, ptr %m_ptr
  %mask = fcmp oeq <2 x float> %m, zeroinitializer
  %load = call <2 x float> @llvm.masked.load.v2f32(ptr %a, i32 8, <2 x i1> %mask, <2 x float> undef)
  store <2 x float> %load, ptr %res_ptr
  ret void
}
declare <2 x float> @llvm.masked.load.v2f32(ptr, i32, <2 x i1>, <2 x float>)

define void @masked_load_v2f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v2f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 2, e64, m1, ta, ma
; RV32-NEXT:    vle64.v v8, (a1)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v0, v8, fa5
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v2f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 2, e64, m1, ta, ma
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v0, v8, fa5
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    ret
  %m = load <2 x double>, ptr %m_ptr
  %mask = fcmp oeq <2 x double> %m, zeroinitializer
  %load = call <2 x double> @llvm.masked.load.v2f64(ptr %a, i32 8, <2 x i1> %mask, <2 x double> undef)
  store <2 x double> %load, ptr %res_ptr
  ret void
}
declare <2 x double> @llvm.masked.load.v2f64(ptr, i32, <2 x i1>, <2 x double>)

define void @masked_load_v4f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v4f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e16, mf2, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <4 x half>, ptr %m_ptr
  %mask = fcmp oeq <4 x half> %m, zeroinitializer
  %load = call <4 x half> @llvm.masked.load.v4f16(ptr %a, i32 8, <4 x i1> %mask, <4 x half> undef)
  store <4 x half> %load, ptr %res_ptr
  ret void
}
declare <4 x half> @llvm.masked.load.v4f16(ptr, i32, <4 x i1>, <4 x half>)

define void @masked_load_v4f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v4f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 4, e32, m1, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <4 x float>, ptr %m_ptr
  %mask = fcmp oeq <4 x float> %m, zeroinitializer
  %load = call <4 x float> @llvm.masked.load.v4f32(ptr %a, i32 8, <4 x i1> %mask, <4 x float> undef)
  store <4 x float> %load, ptr %res_ptr
  ret void
}
declare <4 x float> @llvm.masked.load.v4f32(ptr, i32, <4 x i1>, <4 x float>)

define void @masked_load_v4f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v4f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; RV32-NEXT:    vle64.v v8, (a1)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v0, v8, fa5
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v4f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 4, e64, m2, ta, ma
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v0, v8, fa5
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    ret
  %m = load <4 x double>, ptr %m_ptr
  %mask = fcmp oeq <4 x double> %m, zeroinitializer
  %load = call <4 x double> @llvm.masked.load.v4f64(ptr %a, i32 8, <4 x i1> %mask, <4 x double> undef)
  store <4 x double> %load, ptr %res_ptr
  ret void
}
declare <4 x double> @llvm.masked.load.v4f64(ptr, i32, <4 x i1>, <4 x double>)

define void @masked_load_v8f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v8f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e16, m1, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <8 x half>, ptr %m_ptr
  %mask = fcmp oeq <8 x half> %m, zeroinitializer
  %load = call <8 x half> @llvm.masked.load.v8f16(ptr %a, i32 8, <8 x i1> %mask, <8 x half> undef)
  store <8 x half> %load, ptr %res_ptr
  ret void
}
declare <8 x half> @llvm.masked.load.v8f16(ptr, i32, <8 x i1>, <8 x half>)

define void @masked_load_v8f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v8f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 8, e32, m2, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <8 x float>, ptr %m_ptr
  %mask = fcmp oeq <8 x float> %m, zeroinitializer
  %load = call <8 x float> @llvm.masked.load.v8f32(ptr %a, i32 8, <8 x i1> %mask, <8 x float> undef)
  store <8 x float> %load, ptr %res_ptr
  ret void
}
declare <8 x float> @llvm.masked.load.v8f32(ptr, i32, <8 x i1>, <8 x float>)

define void @masked_load_v8f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v8f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 8, e64, m4, ta, ma
; RV32-NEXT:    vle64.v v8, (a1)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v0, v8, fa5
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v8f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 8, e64, m4, ta, ma
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v0, v8, fa5
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    ret
  %m = load <8 x double>, ptr %m_ptr
  %mask = fcmp oeq <8 x double> %m, zeroinitializer
  %load = call <8 x double> @llvm.masked.load.v8f64(ptr %a, i32 8, <8 x i1> %mask, <8 x double> undef)
  store <8 x double> %load, ptr %res_ptr
  ret void
}
declare <8 x double> @llvm.masked.load.v8f64(ptr, i32, <8 x i1>, <8 x double>)

define void @masked_load_v16f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v16f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e16, m2, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <16 x half>, ptr %m_ptr
  %mask = fcmp oeq <16 x half> %m, zeroinitializer
  %load = call <16 x half> @llvm.masked.load.v16f16(ptr %a, i32 8, <16 x i1> %mask, <16 x half> undef)
  store <16 x half> %load, ptr %res_ptr
  ret void
}
declare <16 x half> @llvm.masked.load.v16f16(ptr, i32, <16 x i1>, <16 x half>)

define void @masked_load_v16f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v16f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsetivli zero, 16, e32, m4, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <16 x float>, ptr %m_ptr
  %mask = fcmp oeq <16 x float> %m, zeroinitializer
  %load = call <16 x float> @llvm.masked.load.v16f32(ptr %a, i32 8, <16 x i1> %mask, <16 x float> undef)
  store <16 x float> %load, ptr %res_ptr
  ret void
}
declare <16 x float> @llvm.masked.load.v16f32(ptr, i32, <16 x i1>, <16 x float>)

define void @masked_load_v16f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v16f64:
; RV32:       # %bb.0:
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV32-NEXT:    vle64.v v8, (a1)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v0, v8, fa5
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v16f64:
; RV64:       # %bb.0:
; RV64-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV64-NEXT:    vle64.v v8, (a1)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v0, v8, fa5
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    ret
  %m = load <16 x double>, ptr %m_ptr
  %mask = fcmp oeq <16 x double> %m, zeroinitializer
  %load = call <16 x double> @llvm.masked.load.v16f64(ptr %a, i32 8, <16 x i1> %mask, <16 x double> undef)
  store <16 x double> %load, ptr %res_ptr
  ret void
}
declare <16 x double> @llvm.masked.load.v16f64(ptr, i32, <16 x i1>, <16 x double>)

define void @masked_load_v32f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v32f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e16, m4, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <32 x half>, ptr %m_ptr
  %mask = fcmp oeq <32 x half> %m, zeroinitializer
  %load = call <32 x half> @llvm.masked.load.v32f16(ptr %a, i32 8, <32 x i1> %mask, <32 x half> undef)
  store <32 x half> %load, ptr %res_ptr
  ret void
}
declare <32 x half> @llvm.masked.load.v32f16(ptr, i32, <32 x i1>, <32 x half>)

define void @masked_load_v32f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v32f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 32
; CHECK-NEXT:    vsetvli zero, a3, e32, m8, ta, ma
; CHECK-NEXT:    vle32.v v8, (a1)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <32 x float>, ptr %m_ptr
  %mask = fcmp oeq <32 x float> %m, zeroinitializer
  %load = call <32 x float> @llvm.masked.load.v32f32(ptr %a, i32 8, <32 x i1> %mask, <32 x float> undef)
  store <32 x float> %load, ptr %res_ptr
  ret void
}
declare <32 x float> @llvm.masked.load.v32f32(ptr, i32, <32 x i1>, <32 x float>)

define void @masked_load_v32f64(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; RV32-LABEL: masked_load_v32f64:
; RV32:       # %bb.0:
; RV32-NEXT:    addi a3, a1, 128
; RV32-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV32-NEXT:    vle64.v v16, (a1)
; RV32-NEXT:    vle64.v v24, (a3)
; RV32-NEXT:    fcvt.d.w fa5, zero
; RV32-NEXT:    vmfeq.vf v8, v16, fa5
; RV32-NEXT:    vmfeq.vf v0, v24, fa5
; RV32-NEXT:    addi a1, a0, 128
; RV32-NEXT:    vle64.v v16, (a1), v0.t
; RV32-NEXT:    vmv1r.v v0, v8
; RV32-NEXT:    vle64.v v8, (a0), v0.t
; RV32-NEXT:    vse64.v v8, (a2)
; RV32-NEXT:    addi a0, a2, 128
; RV32-NEXT:    vse64.v v16, (a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: masked_load_v32f64:
; RV64:       # %bb.0:
; RV64-NEXT:    addi a3, a1, 128
; RV64-NEXT:    vsetivli zero, 16, e64, m8, ta, ma
; RV64-NEXT:    vle64.v v16, (a1)
; RV64-NEXT:    vle64.v v24, (a3)
; RV64-NEXT:    fmv.d.x fa5, zero
; RV64-NEXT:    vmfeq.vf v8, v16, fa5
; RV64-NEXT:    vmfeq.vf v0, v24, fa5
; RV64-NEXT:    addi a1, a0, 128
; RV64-NEXT:    vle64.v v16, (a1), v0.t
; RV64-NEXT:    vmv1r.v v0, v8
; RV64-NEXT:    vle64.v v8, (a0), v0.t
; RV64-NEXT:    vse64.v v8, (a2)
; RV64-NEXT:    addi a0, a2, 128
; RV64-NEXT:    vse64.v v16, (a0)
; RV64-NEXT:    ret
  %m = load <32 x double>, ptr %m_ptr
  %mask = fcmp oeq <32 x double> %m, zeroinitializer
  %load = call <32 x double> @llvm.masked.load.v32f64(ptr %a, i32 8, <32 x i1> %mask, <32 x double> undef)
  store <32 x double> %load, ptr %res_ptr
  ret void
}
declare <32 x double> @llvm.masked.load.v32f64(ptr, i32, <32 x i1>, <32 x double>)

define void @masked_load_v64f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v64f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    li a3, 64
; CHECK-NEXT:    vsetvli zero, a3, e16, m8, ta, ma
; CHECK-NEXT:    vle16.v v8, (a1)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v0, v8, fa5
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    ret
  %m = load <64 x half>, ptr %m_ptr
  %mask = fcmp oeq <64 x half> %m, zeroinitializer
  %load = call <64 x half> @llvm.masked.load.v64f16(ptr %a, i32 8, <64 x i1> %mask, <64 x half> undef)
  store <64 x half> %load, ptr %res_ptr
  ret void
}
declare <64 x half> @llvm.masked.load.v64f16(ptr, i32, <64 x i1>, <64 x half>)

define void @masked_load_v64f32(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v64f32:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a3, a1, 128
; CHECK-NEXT:    li a4, 32
; CHECK-NEXT:    vsetvli zero, a4, e32, m8, ta, ma
; CHECK-NEXT:    vle32.v v16, (a1)
; CHECK-NEXT:    vle32.v v24, (a3)
; CHECK-NEXT:    fmv.w.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v8, v16, fa5
; CHECK-NEXT:    vmfeq.vf v0, v24, fa5
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    vle32.v v16, (a1), v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vle32.v v8, (a0), v0.t
; CHECK-NEXT:    vse32.v v8, (a2)
; CHECK-NEXT:    addi a0, a2, 128
; CHECK-NEXT:    vse32.v v16, (a0)
; CHECK-NEXT:    ret
  %m = load <64 x float>, ptr %m_ptr
  %mask = fcmp oeq <64 x float> %m, zeroinitializer
  %load = call <64 x float> @llvm.masked.load.v64f32(ptr %a, i32 8, <64 x i1> %mask, <64 x float> undef)
  store <64 x float> %load, ptr %res_ptr
  ret void
}
declare <64 x float> @llvm.masked.load.v64f32(ptr, i32, <64 x i1>, <64 x float>)

define void @masked_load_v128f16(ptr %a, ptr %m_ptr, ptr %res_ptr) nounwind {
; CHECK-LABEL: masked_load_v128f16:
; CHECK:       # %bb.0:
; CHECK-NEXT:    addi a3, a1, 128
; CHECK-NEXT:    li a4, 64
; CHECK-NEXT:    vsetvli zero, a4, e16, m8, ta, ma
; CHECK-NEXT:    vle16.v v16, (a1)
; CHECK-NEXT:    vle16.v v24, (a3)
; CHECK-NEXT:    fmv.h.x fa5, zero
; CHECK-NEXT:    vmfeq.vf v8, v16, fa5
; CHECK-NEXT:    vmfeq.vf v0, v24, fa5
; CHECK-NEXT:    addi a1, a0, 128
; CHECK-NEXT:    vle16.v v16, (a1), v0.t
; CHECK-NEXT:    vmv1r.v v0, v8
; CHECK-NEXT:    vle16.v v8, (a0), v0.t
; CHECK-NEXT:    vse16.v v8, (a2)
; CHECK-NEXT:    addi a0, a2, 128
; CHECK-NEXT:    vse16.v v16, (a0)
; CHECK-NEXT:    ret
  %m = load <128 x half>, ptr %m_ptr
  %mask = fcmp oeq <128 x half> %m, zeroinitializer
  %load = call <128 x half> @llvm.masked.load.v128f16(ptr %a, i32 8, <128 x i1> %mask, <128 x half> undef)
  store <128 x half> %load, ptr %res_ptr
  ret void
}
declare <128 x half> @llvm.masked.load.v128f16(ptr, i32, <128 x i1>, <128 x half>)
