# $MidnightBSD$

PORTNAME=	mod_python
PORTVERSION=	3.3.1
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_APACHE_HTTPD}
MASTER_SITE_SUBDIR=	modpython
PKGNAMEPREFIX=	${APACHE_PKGNAMEPREFIX}
PKGNAMESUFFIX=        33
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache module that embeds the Python interpreter within the server

LICENSE=	apache2

USE_APACHE=	22
USES=		python

MAKE_ARGS+=	APXS=${APXS}

INSTALLS_EGGINFO=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-apxs="${APXS}" --with-python="${PYTHON_CMD}" \
		--without-flex
MAKE_ENV=	EXPR_COMPAT=yes

.include <bsd.port.mk>
