import uvicorn
from fastapi import FastAPI
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
from starlette_exporter import PrometheusMiddleware, handle_metrics

app = FastAPI()
app.add_middleware(PrometheusMiddleware, app_name="modern-dev")
app.add_route("/metrics", handle_metrics)


FastAPIInstrumentor.instrument_app(app)


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/hello")
def read_root2():
    return {"Hello": "World"}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=5000)
