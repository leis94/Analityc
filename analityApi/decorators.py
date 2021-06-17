from django.shortcuts import redirect

def token_required(view_func):
	def wrap(request, *args, **kwargs):
		token = request.session.get("access_token",None)
		
		proyectos = request.session.get('proyectos', ['AVIANCA','ÉXITO','LUMEN','BACKOFFICE','PMO ITS','VICAL'])

		if token:
			return view_func(request, proyectos, *args, **kwargs)
		else:
			#return view_func(request, proyectos, *args, **kwargs)
			return redirect('/login/')
	return wrap