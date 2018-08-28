# $MidnightBSD$
# $FreeBSD: ports/devel/autoconf-wrapper/Makefile,v 1.3 2007/11/09 14:47:26 des Exp $

PORTNAME?=	autoconf-wrapper
PORTVERSION=	20131203
CATEGORIES=	devel
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Wrapper script for GNU autoconf
LICENSE=	bsd2

WRKSRC=		${WRKDIR}
NO_BUILD=	YES

TOOL?=		AUTOCONF
WRAPPED_TOOLS?=	autoconf autoheader autom4te autoreconf autoscan \
		autoupdate ifnames
.include <bsd.port.pre.mk>

TOOLS_CASE!=	${ECHO_CMD} ${WRAPPED_TOOLS} | ${TR} ' ' '|'
PLIST_FILES=	bin/${PORTNAME}
.for tool in ${WRAPPED_TOOLS}
PLIST_FILES+=	bin/${tool}
.endfor

do-configure:
	@${SED} \
	    -e 's,%%PREFIX%%,${PREFIX},g' \
	    -e 's,%%TOOL%%,${TOOL},g' \
	    -e 's,%%TOOLS_CASE%%,${TOOLS_CASE},g' \
	    <${FILESDIR}/autotools-wrapper.sh >${WRKDIR}/${PORTNAME}.sh

do-install:
	@${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh ${PREFIX}/bin/${PORTNAME}
.for tool in ${WRAPPED_TOOLS}
	@${LN} -sf ${PORTNAME} ${PREFIX}/bin/${tool}
.endfor

.include <bsd.port.post.mk>
