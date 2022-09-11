PORTNAME=	mhonarc
PORTVERSION=	2.6.24
CATEGORIES=	www mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WWW front end for mail archives

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe tar:bzip2 perl5
USE_GITHUB=	YES
GH_ACCOUNT=	sympa-community
GH_PROJECT=	MHonArc

NO_BUILD=	yes
NO_ARCH=	yes

INSTALL_ARGS=	-prefix ${FAKE_DESTDIR} -binpath ${FAKE_DESTDIR}${TRUE_PREFIX}/bin \
		-libpath ${FAKE_DESTDIR}${TRUE_PREFIX}/${SITE_PERL_REL} \
		-manpath ${FAKE_DESTDIR}${TRUE_PREFIX}/man \
		-batch

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
THEDOCSDIR=	${PREFIX}/share/doc/MHonArc
DOCSDIR=${PREFIX}/share/doc/MHonArc
INSTALL_ARGS+=	-docpath ${THEDOCSDIR}
.else
INSTALL_ARGS+=	-nodoc
.endif

do-install:
	cd ${WRKSRC} && ${PERL5} install.me ${INSTALL_ARGS}

.for file in mha-dbedit mha-dbrecover mha-decode mhonarc
	${REINPLACE_CMD} -E -e 's,${FAKE_DESTDIR},,g' ${PREFIX}/bin/${file}
	${RM} ${PREFIX}/bin/${file}.bak
.endfor

.include <bsd.port.mk>
