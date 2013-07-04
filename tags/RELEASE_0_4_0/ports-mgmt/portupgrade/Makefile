# $MidnightBSD: mports/ports-mgmt/portupgrade/Makefile,v 1.13 2010/02/27 19:19:54 laffer1 Exp $

PORTNAME=	portupgrade
PORTVERSION=	2.4.6
PORTREVISION=	4
PORTEPOCH=	2
CATEGORIES=	ports-mgmt
MASTER_SITES=	SF/${PORTNAME}/pkgtools/${PORTVERSION}
MASTER_SITE_SUBDIR=	${PORTNAME}
DISTNAME=	pkgtools-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BSD ports/packages administration and management tool suite
LICENSE=	bsd3

USE_BZIP2=	yes
USE_RUBY=	yes
USE_RUBY_FEATURES=	optparse ruby18
USE_PERL5_RUN=	yes

LDCONFIG_DIRS=	%%PREFIX%%/lib/compat/pkg
USE_LDCONFIG=	${PREFIX}/lib/compat/pkg

MAKE_ARGS=	PREFIX="${PREFIX}" RUBY="${RUBY}"

MAN1=		pkg_deinstall.1 \
		pkg_glob.1 \
		pkg_sort.1 \
		pkgdb.1 \
		pkgdu.1 \
		portcvsweb.1 \
		portsclean.1 \
		portsdb.1 \
		portupgrade.1 \
		portversion.1
MAN5=		pkgtools.conf.5
MLINKS=		pkgdb.1 pkg_which.1 \
		portupgrade.1 portinstall.1 \
		portsdb.1 ports_glob.1

EXAMPLESDIR=    ${PREFIX}/share/examples/pkgtools
DOCSDIR=        ${PREFIX}/share/doc/pkgtools

MANCOMPRESSED=	yes

INSTALL_TARGET=		install
.if !defined(NOPORTDOCS)
INSTALL_TARGET+=	install-doc
.endif

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/misc/ldconfig_compat/bsd.ldconfig.mk"

.if ${OSVERSION} > 4003
IGNORE=	not compatible with mport tools
.endif

RUN_DEPENDS+=	${RUBY_SITEARCHLIBDIR}/bdb.so:${PORTSDIR}/databases/ruby-bdb

post-patch:
.for i in bin/pkgdu bin/pkg_fetch bin/pkgdb bin/portsclean bin/portsdb bin/portupgrade bin/portversion etc/pkgtools.conf Makefile lib/portsdb.rb misc/bash/complete.sample misc/zsh/_pkgtools tests/test_portinfo.rb tests/test_portsdb.rb
	@cd ${WRKSRC}; \
	${SED} 's/\/usr\/ports/\/usr\/mports/' < $i > convert.txt; \
	${MV} convert.txt $i ; \
	${SED} 's/sysutils\/portupgrade/\/ports-mgmt\/portupgrade/' < $i > convert2.txt; \
	${MV} convert2.txt $i
.endfor
	${REINPLACE_CMD} -e 's|ftp.FreeBSD.org|ftp.midnightbsd.org|g;' \
			-e 's|FreeBSD/ports|MidnightBSD/mports/packages|g' \
			-e 's|FreeBSD|MidnightBSD|g' \
		${WRKSRC}/lib/pkgtools.rb

pre-install:
	${MKDIR} ${RUBY_SITELIBDIR}

post-install:
	if [ ! -f ${PREFIX}/etc/pkgtools.conf ]; then \
		${CP} -p ${PREFIX}/etc/pkgtools.conf.sample ${PREFIX}/etc/pkgtools.conf; \
	fi
	${MKDIR} ${PREFIX}/lib/compat/pkg

.include <bsd.port.post.mk>
