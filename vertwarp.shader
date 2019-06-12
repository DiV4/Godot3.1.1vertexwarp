shader_type spatial;

void vertex() {
	VERTEX = (WORLD_MATRIX * vec4(VERTEX, 1.0)).xyz; //Can't apply distortion globally without this line
	vec3 temp = CAMERA_MATRIX[3].xyz - VERTEX.xyz; //Substracting vertex coordinates from camera position
	float dist = length(temp) / 50.0; //Getting the distance by measuring the length of the previous vector
	VERTEX.y -= pow(dist, 3.0); //Power of 3 to make the effect more visible
	VERTEX = (inverse(WORLD_MATRIX) * vec4(VERTEX, 1.0)).xyz; //Can't apply distortion globally without this line
}