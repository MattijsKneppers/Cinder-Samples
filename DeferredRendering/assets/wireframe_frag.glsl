#version 120
#extension GL_EXT_gpu_shader4 : enable

noperspective varying vec3	vDistance;

void main() {
	// determine frag distance to closest edge
	float fNearest = min(min(vDistance[0],vDistance[1]),vDistance[2]);
	float fEdgeIntensity = exp2(-1.0*fNearest*fNearest);

	// blend between edge color and face color
	const vec4 vFaceColor = vec4(1.0, 1.0, 1.0, 1.0);
	const vec4 vEdgeColor = vec4(0.1, 0.1, 0.1, 1.0);
	gl_FragColor = mix(vEdgeColor, vFaceColor, fEdgeIntensity);
}