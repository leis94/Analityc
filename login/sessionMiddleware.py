class sessionMiddleware():
	def __init__(self, get_response):
		print("Middleware registrado")
		self.get_response = get_response

	def __call__(self, request):
		print("Ejecutando middleware")
		response = self.get_response(request)

		return response

	def process_view(self, request, view_func, view_args, view_kwargs):
		print (request, view_func, view_args, view_kwargs)
		return None