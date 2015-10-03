# Created by: Adam Weinberger <adamw@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/textproc/highlight/Makefile 394776 2015-08-19 12:15:45Z kwm $

PORTNAME=	highlight
PORTVERSION=	3.23
CATEGORIES=	textproc
MASTER_SITES=	http://www.andre-simon.de/zip/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Customizable syntax highlighter

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	boost-libs>0:${PORTSDIR}/devel/boost-libs

FAKE_OPTS=	trueprefix

USE_DOS2UNIX=	yes
USES=		dos2unix gmake lua:52 pkgconfig tar:bzip2
MAKEFILE=	makefile
MAKE_ARGS=	CXX="${CXX}" \
		CFLAGS="${CXXFLAGS} ${CPPFLAGS} -DHAVE_DECL_GETOPT" \
		LDFLAGS="${LDFLAGS}" 

PORTDOCS=	*

pre-patch: dos2unix

post-patch:
	@${REINPLACE_CMD} \
		-e 's|^PREFIX =|PREFIX ?=|' \
		-e 's|^conf_dir =.*|conf_dir = $${PREFIX}/etc/highlight/|' \
		${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e 's|^CXX=|CXX?=|' \
		-e 's|%%LOCALBASE%%|${LOCALBASE}|' \
		${WRKSRC}/src/${MAKEFILE}

post-install:
	@cd ${PREFIX}/etc/highlight && ${MV} filetypes.conf \
		filetypes.conf.sample

.include <bsd.port.mk>
