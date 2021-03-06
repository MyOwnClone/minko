package aerys.minko.render.material.vertex
{
	import aerys.minko.render.RenderTarget;
	import aerys.minko.render.material.basic.BasicShader;
	import aerys.minko.render.material.basic.BasicProperties;
	import aerys.minko.render.material.basic.BasicShader;
	import aerys.minko.render.shader.SFloat;
	import aerys.minko.render.geometry.stream.format.VertexComponent;
	
	public class VertexUVShader extends BasicShader
	{
		
		public function VertexUVShader(target 	: RenderTarget 	= null, 
									   priority	: Number		= 0)
		{
			super(target, priority);
		}
		
		override protected function getPixelColor() : SFloat
		{
			var uv 				: SFloat = getVertexAttribute(VertexComponent.UV);
			
			if (meshBindings.propertyExists(BasicProperties.DIFFUSE_UV_SCALE))
				uv.scaleBy(meshBindings.getParameter(BasicProperties.DIFFUSE_UV_SCALE, 2));
			
			if (meshBindings.propertyExists(BasicProperties.DIFFUSE_UV_OFFSET))
				uv.incrementBy(meshBindings.getParameter(BasicProperties.DIFFUSE_UV_OFFSET, 2));

			var interpolatedUv 	: SFloat = fractional(interpolate(uv));
			
			return float4(interpolatedUv.x, interpolatedUv.y, 0, 1);
		}
		
	}
}