shader_type spatial;
render_mode world_vertex_coords; //This render_mode ensures all vertex operations are done in world space

void vertex() {
//Big thanks to mux213 for helping with this code!
	VERTEX = (WORLD_MATRIX * vec4(VERTEX, 1.0)).xyz; //Adjusting vertex positions to world space
	NORMAL = (WORLD_MATRIX * vec4(NORMAL, 0.0)).xyz; //Adjusting normals to world space
	float dist = length(CAMERA_MATRIX[3].xyz - VERTEX) / 50.0; //Getting distance between camera and the vertices
	VERTEX.y -= pow(dist, 3.0); // Moving vertices vertically accordingly
}
