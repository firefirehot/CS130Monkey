varying vec3 normal;
varying vec4 world_position;

void main()
{
vec3 diff;
    vec3 L;
    vec3 R;
    vec3 camera = vec3(0,0,0);
    vec3 V;
    float intensity_specular;
    float intensity_diffuse;
    float theNumberTwo = 2.0;
    
  gl_FragColor.rgb += gl_FrontMaterial.ambient.rgb; //gl_LightModel.ambient.rgb
    
    for(int i = 0; i < gl_MaxLights; i++){
		diff = vec3(gl_LightSource[i].position - world_position);	//distance to light
		L = normalize(diff);  //light vector
		//normal = normalize(N); //normal vector
		intensity_diffuse = max(dot(L, normal),0.0); //intensity for the ambeint light
		V = normalize(camera - world_position.rgb); // view vector
		R = theNumberTwo*dot(normal,L)*normal - L;
		intensity_specular = pow(max(dot(V, R),0.0),gl_FrontMaterial.shininess);
		
		
		  
		gl_FragColor.rgb += intensity_diffuse * gl_FrontMaterial.diffuse.rgb * gl_LightSource[i].diffuse.rgb;//diffuse
		gl_FragColor.rgb += intensity_specular * gl_FrontMaterial.specular.rgb * gl_LightSource[i].specular.rgb;//specular
		gl_FragColor.a = 1.0;
		
	}
}
