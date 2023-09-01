PORTNAME=	elixir
DISTVERSIONPREFIX=	v
DISTVERSION=	1.14.5
CATEGORIES=	lang
MASTER_SITES+=	https://github.com/elixir-lang/elixir/releases/download/${DISTVERSIONPREFIX}${PORTVERSION}/:doc
DISTFILES=	Docs.zip:doc
DIST_SUBDIR=	elixir/${PORTVERSION}

MAINTAINER=	erlang@FreeBSD.org
COMMENT=	Functional, meta-programming aware language built on top of Erlang VM
WWW=		https://elixir-lang.org/

LICENSE=	apache2

FAKE_OPTS+=	trueprefix

BUILD_DEPENDS=	erlang>25:lang/erlang
RUN_DEPENDS=	erlang>25:lang/erlang

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	elixir-lang
CONFLICTS=	elixir-devel # bin/elixir bin/elixirc bin/iex
USE_LOCALE=	en_US.UTF-8
ALL_TARGET=	# empty
REINPLACE_ARGS=	-i ""
NO_ARCH=	yes
NO_TEST=	yes
OPTIONS_SUB=	yes
MAKE_ENV=	MAN_PREFIX=${PREFIX}/man \
		PATH="${LOCALBASE}/lib/erlang/bin:${PATH}"

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-extract:
	@${FIND} ${WRKDIR}/doc -name .build -delete

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKDIR}/doc/ && ${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${DOCSDIR}

post-install:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib
	cd ${WRKSRC}/lib/ && for lib in *; do \
		${MKDIR} ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib/$${lib}/lib; \
		cd ${WRKSRC}/lib/$${lib}/lib && \
			${COPYTREE_SHARE} \* ${FAKE_DESTDIR}${PREFIX}/lib/elixir/lib/$${lib}/lib; \
	done

.include <bsd.port.mk>
