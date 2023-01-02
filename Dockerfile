FROM python:3.11 as build-image

WORKDIR /workspaces/modern-dev/

RUN pip install poetry && poetry config virtualenvs.in-project true

COPY poetry.lock pyproject.toml /workspaces/modern-dev/

RUN poetry install

FROM python:3.11-alpine

WORKDIR /workspaces/modern-dev/src

COPY --from=build-image /workspaces/modern-dev/ /workspaces/modern-dev/

EXPOSE 80

COPY src/* /workspaces/modern-dev/src/

ENV PATH="/workspaces/modern-dev/.venv/bin:$PATH"

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
