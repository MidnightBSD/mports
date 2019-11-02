# $MidnightBSD$
# $FreeBSD: ports/mail/libspf/Makefile,v 1.15 2010/12/04 07:32:30 ade Exp $

PORTNAME=	libspf
DISTVERSION=	1.0.0-p5
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://www.libspf.org/files/src/ \
		FREEBSD_LOCAL/mnag/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sender Policy Framework (SPF) library and client

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

MAKE_JOBS_UNSAFE=yes

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip
USES=		autoreconf libtool tar:bzip2
USE_LDCONFIG=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	RFC_RECURSION LOGFILE_STATS DEBUG DOCS EXAMPLES
RFC_RECURSION_DESC=	Change SPF recursion to 20 (as per RFC)
LOGFILE_STATS_DESC=	Enables logfile stats

RFC_RECURSION_CONFIGURE_ON=   --enable-rfc-recursion
LOGFILE_STATS_CONFIGURE_ON=   --enable-logfile-stats
DEBUG_CONFIGURE_ON=   --enable-debug

post-extract:
	@${CHMOD} u+w ${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

post-install:
	@${MKDIR} ${DOCSDIR}
	@${FIND} ${WRKSRC}/docs -type d -name CVS | ${XARGS} ${RM} -rf
.for i in docs docs/API docs/API/doxygen docs/API/doxygen/html docs/RFC docs/qmail \
	docs/qmail/1.03 docs/qmail/1.04 docs/qmail/1.05 docs/spfqtool docs/Postfix \
	docs/Postfix/2.1.x docs/Sendmail docs/Sendmail/8.12.x docs/Sendmail/8.13.x \
	docs/Courier-MTA docs/history
	@${MKDIR} ${DOCSDIR}/${i}
	@for f in `${FIND} ${WRKSRC}/${i} ! -type d -maxdepth 1`; do \
		${INSTALL_DATA} $${f} ${DOCSDIR}/${i}; \
	done
.endfor
	@${MKDIR} ${EXAMPLESDIR}
	@${FIND} ${WRKSRC}/examples -type d -name CVS | ${XARGS} ${RM} -rf
.for i in examples/qmail examples/qmail/control examples/Sendmail
	@${MKDIR} ${EXAMPLESDIR}/${i}
	@for f in `${FIND} ${WRKSRC}/${i} ! -type d -maxdepth 1`; do \
		${INSTALL_DATA} $${f} ${EXAMPLESDIR}/${i}; \
	done
.endfor
	@${MKDIR} ${DATADIR}
	@${FIND} ${WRKSRC}/patches -type d -name CVS | ${XARGS} ${RM} -rf
.for i in patches patches/qmail patches/qmail/1.03 patches/qmail/1.05 patches/Postfix \
	patches/Postfix/2.1.x patches/Sendmail patches/Sendmail/8.12.x patches/Sendmail/8.13.x \
	patches/Courier-MTA
	@${MKDIR} ${DATADIR}/${i}
	@for f in `${FIND} ${WRKSRC}/${i} ! -type d -maxdepth 1`; do \
		${INSTALL_DATA} $${f} ${DATADIR}/${i}; \
	done
.endfor

.include <bsd.port.mk>
