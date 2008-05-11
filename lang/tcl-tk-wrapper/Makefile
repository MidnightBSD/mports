# Ports collection makefile for:	tcl-tk-wrapper
# Date created:			4 March 2007
# Whom:	      			martin@matuska.org
#
# $MidnightBSD: mports/lang/tcl-tk-wrapper/Makefile,v 1.2 2007/09/21 18:56:03 ctriv Exp $
# $FreeBSD: ports/lang/tcl-tk-wrapper/Makefile,v 1.1 2007/03/06 19:38:10 miwi Exp $
#

PORTNAME=	wrapper
PORTVERSION=	1.0
CATEGORIES=	lang tcl tk
MASTER_SITES=	# empty
PKGNAMEPREFIX=	tcl-tk-
DISTFILES=	# none
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shell wrapper for tclsh and wish (Tcl/Tk)
LICENSE=	unknown

NO_BUILD=	yes

TCLTK_CONF=	${PREFIX}/etc/tcltk.conf

SUB_FILES=	tclsh wish tcltk.conf.sample pkg-message
SUB_LIST+=	ECHO_CMD="${ECHO_CMD}" GREP="${GREP}" LS="${LS}" \
		TCLTK_CONF="${TCLTK_CONF}"
PLIST_FILES=	bin/tclsh bin/wish etc/tcltk.conf.sample

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/tclsh ${PREFIX}/bin/tclsh
	${INSTALL_SCRIPT} ${WRKDIR}/wish ${PREFIX}/bin/wish
	${INSTALL_DATA} ${WRKDIR}/tcltk.conf.sample ${PREFIX}/etc/tcltk.conf.sample


.include <bsd.port.mk>
