# ex:ts=8
# Ports collection makefile for:	xmlrpc++
# Date created:			Feb 26, 2008
# Whom:				Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD$
#

PORTNAME=	xmlrpc++
PORTVERSION=	0.7
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	xmlrpcpp
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A C++ implementation of the XML-RPC protocol
LICENSE=	lgpl

USE_GCC=	3.4
USE_GMAKE=	yes

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e "s|^CXX|#CXX|" -e "s|^CXXFLAGS|#CXXFLAGS|" \
		-e "s|tests$$||" ${WRKSRC}/Makefile

do-install:
	${MKDIR} ${PREFIX}/include/xmlrpc++
	${INSTALL_DATA} ${WRKSRC}/src/XmlRpc*.h ${PREFIX}/include/xmlrpc++
	${INSTALL_PROGRAM} ${WRKSRC}/libXmlRpc.a ${PREFIX}/lib

.include <bsd.port.post.mk>
