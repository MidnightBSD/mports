# $MidnightBSD: mports/textproc/gnome-doc-utils/Makefile,v 1.8 2013/07/03 20:37:26 laffer1 Exp $

PORTNAME=	gnome-doc-utils
PORTVERSION=	0.20.3
PORTREVISION=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME doc utils

LICENSE=	gpl2

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian \
		${PYTHON_SITELIBDIR}/libxml2mod.so:${PORTSDIR}/textproc/py-libxml2 \
    		gawk:${PORTSDIR}/lang/gawk
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian \
		${PYTHON_SITELIBDIR}/libxml2mod.so:${PORTSDIR}/textproc/py-libxml2 \
		${LOCALBASE}/share/xml/docbook/4.3/catalog.xml:${PORTSDIR}/textproc/docbook-xml-430 \
		${LOCALBASE}/share/xml/docbook/4.4/catalog.xml:${PORTSDIR}/textproc/docbook-xml-440

USE_BZIP2=	yes
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=yes
USE_GNOME=	gnomehier gnomehack libxslt intlhack
USES+=		gettext pathfix pkgconfig
USE_PYTHON=	yes
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-omf-dir=${PREFIX}/share/omf
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		xml2po.1

post-install:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -d ${TRUE_PREFIX} -l ${PYTHON_SITELIBDIR}/xml2po
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -d ${TRUE_PREFIX} -l ${PYTHON_SITELIBDIR}/xml2po/modes

.include <bsd.port.mk>
